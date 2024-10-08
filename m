Return-Path: <linux-gpio+bounces-11054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CE4994FBB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E59A28820A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B6A1DFD9E;
	Tue,  8 Oct 2024 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pmwZZwWu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216401DFD8E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394059; cv=none; b=GmqLnfsSJgoj1/ok1u8kWjX9ty4JGL0VR/W7zNgObldKrU/s4dL0RNIz2ZlPQa06hDktLJ2WOmWyaPb8PFncqu+Ky5VqYfWx76WqrsMh4/CsyvkUjf7jYT3qUZXgXpWCnohSkhfKxJF4v+REmbeAnmMraiwHaYf+ICfyGYRtz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394059; c=relaxed/simple;
	bh=jv4UP+nXKBwVqWQ3aNyl9nRwNXUlBUjAiqv7Zi7sSDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmMAB5BqrrOXlvF/Pahe2Nj1EX8QQz5BJ9nlrSGmbroiR+F4NpWret/UJNT3CW6uFw9/qCcqux5qWqNIrYUmsvp37bqA3EMDPxNpAxAQfaUeT210xbliS5InWFl1ZFpJ0pVsATbgl0YobfjfI8oUhNTrrGOjXt28ZDRt3/N77jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pmwZZwWu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5399675e14cso6474200e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394056; x=1728998856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv4UP+nXKBwVqWQ3aNyl9nRwNXUlBUjAiqv7Zi7sSDY=;
        b=pmwZZwWulYli5/84Abl6xcLRAnU1yORLSxj1Y6T25VyXeXGPk4cqfQ/0mCEd5yhfHP
         YSBDncFi+Zz1bgIr0YnhLrLYkOKp04+Kaq0CEjlRvCuqgkKzeXrEQbPj1TUckYvRo8oP
         4VnGjuGPEZ/NGQ84QBsu8QOhfSOG/ZgxwituHAPnSgTJFtYuPt25QLNYtJpHV6YfFrYx
         vN9ZtslnmzFsvlurUr8IvmYqvYm4I2YAetSrg7ThgQERg2K9/DzvPvTxVAC4y2ho8aAK
         AKsaH6Kt1lQHhErkHnfhgekA7y8bta6PLSgBlckkVtNJBPm3W0hDCLvSIjTmKSog/2Gx
         vTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394056; x=1728998856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv4UP+nXKBwVqWQ3aNyl9nRwNXUlBUjAiqv7Zi7sSDY=;
        b=tvS/YPO0XWwo+TW+0+cUCX+aRsDBNS0gKQ5E0llulPaHfea2gBuAJHfwnojeiDHuwX
         EK1B9g8TVCgUYpZMLThHliFjoij/sye9pR0UHO/46GoxuRrv91kzWdzpfDcB9Y+5rg4v
         8oHSKqWPV77L0qkeUVjUkRFM3nj+Xh+pvJjS/fNna6lRL7lJsTsIysBpKqZLJfcI5NgJ
         CMiHZYXNBO62AIVXyALtrYOiEl/ldFct3spaSSc1NC/La4FkEgRSbqoxMPfJWDjXan7n
         9L9nlbFwPuykWcBxcchoa2x1XqEEAApdOCGxcmRI2knU0dZdoicbCIc1gvz7Bu/23NRS
         rO7Q==
X-Gm-Message-State: AOJu0YyN8cl8u+2C6xBxJAYoAEJWGXGuzV2sskLeKrsZ7e0XIcjMNrSz
	qvOLMBTw2EmqVDfuqJsfV5cM8Hn/hxwPZZsl1f/XrYBQaLP34XaupTnlN9m/Rq4Ik3uGATvAroD
	x63U4EoQLituIDNHZRH73XfMUBlHSkNOUquSD/A==
X-Google-Smtp-Source: AGHT+IHbH3TaxaSGVhDkWFmcwgk8MMkbHn1IV+ZZ2lULbNdAr6r/lT60xnb5y5yTHpqmYs7Z9ei/O/7WdODcwaDvtRo=
X-Received: by 2002:a05:6512:3b10:b0:539:a353:2799 with SMTP id
 2adb3069b0e04-539ab889f18mr8577445e87.26.1728394056162; Tue, 08 Oct 2024
 06:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-15-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-15-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:27:25 +0200
Message-ID: <CAMRc=Mdy8+8psttse=Bs++30=3DrDhwmqhkqutt_1ZrTfKEApA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 15/22] bindings: python: tests: clean up imports
 and exports
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>

I'm going to nag you again for the commit message but I think it's
important to say what exactly you're improving here (ordering, remove
unneeded gpiosim import, etc.). The patch otherwise looks good to me.

Bart

