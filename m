Return-Path: <linux-gpio+bounces-11039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D817994D2A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C801F22D5D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E48F1C32EB;
	Tue,  8 Oct 2024 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kKbZcQoT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8BF1DFD1
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392549; cv=none; b=XnFf0Vy95unYeGPzeucV/JyJdIVW38cDxm12cgRxTTj9QLu4s5b29MjJAoMoHTBAhiDymFEnobQwB880BhS1b87h5QL0jFfX6q0C7nqqlMfuUVdMsI9tNjS92yV8UWfxFQVIZYXvUOHEropFNYLGKOWbZNl7OcbmKEnmErPdKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392549; c=relaxed/simple;
	bh=enMZdHm7h8u+yM4kNLzmeKXpU1uEZT/aeBUPXgCc84Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTCGUtq4oSADiEsCmt8V6aCKPwu7Fvof64NbB/78uTix59F4GFe2xnN1mI6C7vSjEVubUe2i7FR894Rw6JU5e5nb10j7OarEnI80jADDVkhRAmPSUro2XO8D1KZKdDcKqy+TGqQ17fXttaq4ngg+Oi49ELTT4Sja/xN99/SnLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kKbZcQoT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539908f238fso6290166e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728392544; x=1728997344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enMZdHm7h8u+yM4kNLzmeKXpU1uEZT/aeBUPXgCc84Q=;
        b=kKbZcQoTqecvmvB9lEP4GmTFuaUvKeAvTnM4xoP8vGBUNCvoz9TX5dEjgZvDRxFhzk
         VgC3rMpClqTLc6xU7ygwFfWUfKiUW0CV9zP7MMhkGS5I9mRXdNOf/pKqLTJP+6kXZhE1
         oCmuvWyVMplAbdNXxsyUhAYxmcsA5Zi2+UwkFfZ2tswcxf5AQCSq1yLlXgKvJTyV//Km
         BmcNGTLErYC9atsGrnmSNBmApB5GYfSXWjxORLmeBvEMlk4pHVygje/AFeZCUap707qK
         lQdsl9wEeAHhEIj/LiNVACW2iNlHzSH3KBAa9+g97tbW/+8rQmr+mn+vffrGDNYSld6R
         EnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392544; x=1728997344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enMZdHm7h8u+yM4kNLzmeKXpU1uEZT/aeBUPXgCc84Q=;
        b=ah78TzyT6fxdlu78yNHgwBFpG8j8i4TW0QSif/7NrKX1rp7bdnc9RnKHlSvPYDzgml
         yZJwAB3yA03dRIbPpPsBCZCEF/iBabA2a+qj0UVDCO3YZlcdMmSkW9rgC2hrJZlKpWBH
         2mPWS4WB9YC6d8/WdJhAKosMB8b/I3ArRyB/y2zSDv3R4r/NCVYT4RMW/8gazZvJbUu5
         v8I6uJvSaNKDhv+eKtHcOROu1PyDMRZc425e5++lLMOTRfG/eo7M1Uh5xKJ3Z4PPPVl0
         DhmBxM2Bq8wUhT0FtjKVUGBvOpAgFBeFRttmL9mUdhV9MTuVpr15474BcLsNdaUewzqZ
         zAZw==
X-Gm-Message-State: AOJu0YxXMOBymuZbECapgXLUkaTiC02fiucnoTnoFSiSc6LQLB9meR5b
	eh93GOGcs1w9E45zlEz3hleW2hJQzHWFsQpIliqWdekXwy6o/VYl/0Xqmv5vWXjRb4ctbtbEHc+
	viUJoozrKBz6DwnskQKKHDSAHeHVPPAwQ57kwZBr2/SOpv2v1
X-Google-Smtp-Source: AGHT+IHsemaaMfZ69fTJVhVqvmzQDILCNWw/7bUsA9UC6m2ZLBvR5sh6HtVHQlyuF4veicl3YY5+h6QatW8AuvWf7MI=
X-Received: by 2002:a05:6512:3089:b0:539:918c:5124 with SMTP id
 2adb3069b0e04-539ab88d663mr7475429e87.31.1728392544052; Tue, 08 Oct 2024
 06:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-3-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-3-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:02:12 +0200
Message-ID: <CAMRc=Mf4wmZzj8hNUmgB9N98tY=FwZzxOkA4XCroN6HzjNNPcg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 03/22] bindings: python: fix annotation of
 variable length tuples
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 9:05=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Both `Chip.request_lines` and `LineRequest.reconfigure_lines` accept a
> config argument that is allowed to be either a variable length tuple
> of int | str, a str, or an int.
>
> Python documentation [0] points out that variable length tuples need a
> trailing ellipsis in their annotation.
>
> [0]: https://docs.python.org/3/library/typing.html#annotating-tuples
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

For my own reference: looks good.

Bart

