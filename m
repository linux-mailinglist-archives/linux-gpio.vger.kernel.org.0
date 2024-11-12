Return-Path: <linux-gpio+bounces-12870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716B9C5874
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17021F233EF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96727080E;
	Tue, 12 Nov 2024 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kp8i1L32"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E545979
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731416438; cv=none; b=ALsTuZFE8GVelBoM1wtOg+NdZcNmJ0a6g0jqhZa/CMIRwvKucnrTp4JUwKZ+DVK2cBaaUpbSL8JOlzW0UOLuPo1F5jI8gwGwtDXdvKU9hf8hTtvpC+2YkH6B46mMYycY9+uFmsY4OaqwhZ4PdXSBNOkwgcmOp4y/GP20AXKiX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731416438; c=relaxed/simple;
	bh=xxcsrKwTLbLkmh5m1jPsVEtj2m13VHgDVPmJLw6lhuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYDKDw2syIfIi8vZj63AWnQvpwx0Jl7yqKgP8JGDAW3qeuQmZqHfbXHywiEFKqYnHaWfls0LkrVOYruuF1P6her4P9Icv5SfkO2aD++I+TTywvj3bZljjH+g4Qciu2fQtjlAHTxuqlAmWC6zwJTy23k3C+r48sc5p3c4VEUrHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kp8i1L32; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so48535271fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731416435; x=1732021235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxcsrKwTLbLkmh5m1jPsVEtj2m13VHgDVPmJLw6lhuE=;
        b=kp8i1L32ukcMr9VROx0twQTzp7Q3Edhobh0goQ73GmbzYByWFULvoETi6IAp77lP10
         KHGm4gAzh5jRGwIB4pzkqNoConKIZqiX1H/pKecQt32R7R9aZqsxHTpXt2qLdLyxj1gX
         3ivCkSp86H76hN1fld56fZIB8CoBYCSU70XFGWVylUWOgwsrc5IUJNFyvwVqCx0I8gZy
         eIXZRkkxz/kmwiLNde6lOQ+2NJ3uQrbkuMojHnxHyobbY98GHWFzCYjb+/oelE1MKGLa
         lGY22WID5Q2m5PhiXr84su1jW3auhY162m1gxlBV1bEd8sNtldkmuDzTxAskgdH2Sg4K
         17XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731416435; x=1732021235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxcsrKwTLbLkmh5m1jPsVEtj2m13VHgDVPmJLw6lhuE=;
        b=joWB9Ku5wYgu0DzKEgGnX88W1clJk0X9LEMsYvZKDwYhAxmvF9uOnpCCJyL9cGSwVE
         HZGegdAr/7J2ADPR9gIlOzU4lwTOam9O+o0p8vrtDPNXFfJY1UoSnJgQZF4Ff6tVFKEJ
         2s0F7e8mBs3RdIuAV89cTFtIn4iyAgm40A+4k03BMvq8wNQtUR2k/klkTcbmZuUzRVl5
         SA3t2WvgsXVnp1ZbRkLMYsaiBmmfemKRFvNnEf3tuFhd/FnKWvG7DJ8jD5qB1yfgT9Fk
         gdCiTCcL9S8yFL9tn0rrywklfaoQ0lxPepij/4+VCJJwyYC5NDwKJZHfcLxDRlVmdI3/
         1v3g==
X-Forwarded-Encrypted: i=1; AJvYcCV1flFSI3+tIBVdiz/oxqIn6opxSAz/4hcO12RlP/nMSz+UdwbqVkUxushLHyi5/T3s++nGOR+Be1un@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLc81U1Obu66oxcojZNvJ9dotqsgXEwIgAMQo2afYSNijzh2P
	RL4uHVSizGphzmxPZEyDfD7hhfMMQ9znIZoFhbMjNufx+cdDyIZiXERE0uKFTSFXvJjS36BJqgB
	Sr4APsfVXK76dv5IuRj72kTpsVYMWaUmqEP4c8SfXMW5n+a9C
X-Google-Smtp-Source: AGHT+IHQoCYbYHwK4npDETvmHL7Ns3QU/iNUUv2vKTdTTfXGw/5QwOIzhnyWGuOFeTfKgpAx9hDGM/xZIqecmd5WxbI=
X-Received: by 2002:a05:651c:1589:b0:2fa:d723:efba with SMTP id
 38308e7fff4ca-2ff20162612mr75705911fa.8.1731416435473; Tue, 12 Nov 2024
 05:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106142248.305219-1-vfazio@xes-inc.com> <CAMRc=Mfm68m52UicB8ZvTuc_Djs-4jzUo=-6YmQzGtfq0BDOmA@mail.gmail.com>
 <CAOrEah6U=c-JJqcoHqH7PpBQ+T-MuAm-Qk++QGpqx1QTnG=Ggg@mail.gmail.com>
In-Reply-To: <CAOrEah6U=c-JJqcoHqH7PpBQ+T-MuAm-Qk++QGpqx1QTnG=Ggg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 14:00:24 +0100
Message-ID: <CAMRc=Mdpcz8QmCSeqDLbNtn+aZ0JAfgpgheiqXqYYJPE5S3pkQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: generate CPython 3.13 wheels
To: Vincent Fazio <vfazio@gmail.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 1:53=E2=80=AFPM Vincent Fazio <vfazio@gmail.com> wr=
ote:
>
> On Tue, Nov 12, 2024 at 6:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Did I get that right on github - this should wait until the typing and
> > other reworks are in place?
>
> I think we can wait to _generate_ wheels after the typing rework is done,=
 but I
> don't think there's any real reason to delay accepting this patch if the
> content looks ok to you
>

Fair enough, applied.

Bart

