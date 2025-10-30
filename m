Return-Path: <linux-gpio+bounces-27871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD70C1FC67
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 12:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C8A2B4E9DC9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C428135470E;
	Thu, 30 Oct 2025 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C79DrG0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F28350D6A
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823075; cv=none; b=V9e/++c6D34zLyhzyOpnFhLwRNsdOWYlbc3y9oL/Lyo0iqofEmEFqdeaGXAPXVOxLlWpULR6dp9Iq4Xa1rJATVgBOa6ktyY2QuXe4iLZC5yJgQi6UQMuI+j3K1Ym7HhSNwTCYoA5HdQWFFTcI9dPknU75Ok1lUWOnVxDXw6/X2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823075; c=relaxed/simple;
	bh=I0ImYUO4Tto0dqVtSdohVygGzsAV8nAsPjZ3zZkTumI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcRDtlkHDCxqdruUL384QI0hckOcanuw7OazkO7GpgDAvrJsjSw6b3EwFsA1ptji+avpevLbDHJdpGOb3qh5+u5iViTo7pB1L6Y2e/00t3gDrnKDiiCfDLwq1nGzpOajRTwPsEOfEHFD25+goOhCPlrnDsXXddbBYADWfejCtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C79DrG0U; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3717780ea70so9941341fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761823072; x=1762427872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MNmIROD9DJ7O2nzFJad82kpZwiRt/s4niUpI4BhGGA=;
        b=C79DrG0Ux1W/gcEarejLESWQHk8ATlYD52nvEDAp9OHWNIcql2qf6j3VgdpMTlDcZf
         /bzUfAENKYqWVzzbF7pKr8Wupp6JYnTDsfqU9YNvCcFyMCJQuh1nzYkV7D41wIoLNXiu
         GUk6Ep6cgT7cWucF8OVfm66zlhPMjnXxR5qRVLokGM43NMb7dFiCvqFAuQvGs4IobfQ+
         4A1kA4LzLQu3aGtcQG/xXeBqymj0gooaQ7I4NmZ+Mu3pCYNEm1xmUHNakLf1lV2MMx3z
         SYsZh3Z6GwN820rxy1t5OdrtmzaBDRMqCtjWl99cAlxkqi2nAzMxESGcB9H95WFkDsEp
         sUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823072; x=1762427872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MNmIROD9DJ7O2nzFJad82kpZwiRt/s4niUpI4BhGGA=;
        b=tluVWo1a4c34GEoE6ZavZ2WZL2/b2og7+erqSEYjPcE3Sh4ZOGDGBGAtasTM67PNAD
         1tJDU1YXueQ+c/nqN7QzHyXhtxwVxk0YknmNVSx+nn1ahq+Ln7oe4GKMcrzR2gE2dTGD
         024LfMDq3sOnfnnoqA6RkrqqhYkhQkJQnmTz14osKXO5j4CG1zS4xdr0U2MhWkNRqxB2
         NcQ71WfPPbtip/bE1Fo8RKiLrQtyygMtjolxo6pIAX7n9g7k5kkNSAly3PtxqvpYPCX9
         a77VrkVX1tozii/pnqBzMQOiUbGk613KHxVGHor2fMXwr5jVHoePWAxSMjWjOK58HBRJ
         2Gng==
X-Forwarded-Encrypted: i=1; AJvYcCV1Eo+OyQa2UwutdaLOf2Hd00pnlwx2sFWF3nL5tWwxkuUkdVnLbTcsV6wig9JQVvKt8S3sLrFI0ydH@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFFv9ABr0pkiGtjzzdTYuQIoNaFiAB2elas7LwvLxDFO+iBQd
	1Mhft3C7C4/Lh0Bh2BGQHH0znXEglwlr5cscQCMulkKdb4sZFbwAfQTxBPhzS1BVVHRSpMjGcpS
	KvHzulRWwNkgXdp+239+hLT+VP9bdMmqq2kj2G3jRmg==
X-Gm-Gg: ASbGnct6leaTNyitWmkB7DEdX+QjBU8idw63565+FkInQNF+ODfCQ/BOMrgTeWkd3I+
	xSv7G0yF0GqL+7eDnDEIyqgUSKnUUhAZvBBB2lTMBZmpnIorgkyFQll8lujaihNLtDfwImS36zG
	cJR53yyIphF3Xti9trShiG5/0q+VZ80TD/vXzfMl2Nxj/xYEdEd6xI2/pskIGF5R1PBSKOk0lrZ
	aDUSloJia6Ry0fBZlJjqZ3eIke4MM+XiIHQF+JI/WNUrRL7ExJRUTAAt2MU7bVoa8e1SCKZn95m
	oCbXAALb+h3tDIjrwEZ7zII6xQ==
X-Google-Smtp-Source: AGHT+IFX1hvDlr8E6u/3OJJAO015DhFeTkPn3N2RUsi5ZPul7fhDyUo0UEVvHpV8XwqIiZrtef+F6vF4DG9rHYHHj1w=
X-Received: by 2002:a2e:a7cf:0:b0:335:44d4:161b with SMTP id
 38308e7fff4ca-37a023f626emr24946961fa.2.1761823071713; Thu, 30 Oct 2025
 04:17:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Oct 2025 04:17:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Oct 2025 04:17:48 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aQMy00pxp7lrIrvh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
 <20251029-reset-gpios-swnodes-v3-3-638a4cb33201@linaro.org> <aQMy00pxp7lrIrvh@smile.fi.intel.com>
Date: Thu, 30 Oct 2025 04:17:48 -0700
X-Gm-Features: AWmQ_bktnmdgURcHnkeHfqBkc9SoaiVf7POsXZokVkxDRgw_XRndf7_XJoV--44
Message-ID: <CAMRc=MdP58d=o7ZL4bAdsaYwzrs6nJo3bhS7Jf1UkDNwPOnAsg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] software node: allow referencing firmware nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Oct 2025 10:41:39 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Oct 29, 2025 at 01:28:37PM +0100, Bartosz Golaszewski wrote:
>>
>> At the moment software nodes can only reference other software nodes.
>> This is a limitation for devices created, for instance, on the auxiliary
>> bus with a dynamic software node attached which cannot reference devices
>> the firmware node of which is "real" (as an OF node or otherwise).
>>
>> Make it possible for a software node to reference all firmware nodes in
>> addition to static software nodes. To that end: add a second pointer to
>> struct software_node_ref_args of type struct fwnode_handle. The core
>> swnode code will first check the swnode pointer and if it's NULL, it
>> will assume the fwnode pointer should be set. Rework the helper macros
>> and deprecate the existing ones whose names don't indicate the reference
>> type.
>>
>> Software node graphs remain the same, as in: the remote endpoints still
>> have to be software nodes.
>
> ...
>
>> -#define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
>> +#define __SOFTWARE_NODE_REF(_ref, _node, ...)			\
>>  (const struct software_node_ref_args) {				\
>> -	.node =3D _ref_,						\
>> +	._node =3D _ref,						\
>>  	.nargs =3D COUNT_ARGS(__VA_ARGS__),			\
>>  	.args =3D { __VA_ARGS__ },				\
>>  }
>
> Okay, looking at this again I think we don't need a new parameter.
> We may check the type of _ref_
> (actually why are the macro parameters got renamed here and elsewhere?)
> and assign the correct one accordingly. I think this is what _Generic()
> is good for.
>

Oh, that's neat, I would love to use _Generic() here but I honest to god ha=
ve
no idea how to make it work. I tried something like:

#define __SOFTWARE_NODE_REF(_ref, ...)                          \
_Generic(_ref,                                                  \
        const struct software_node *:                           \
                (const struct software_node_ref_args) {         \
                        .swnode =3D _ref,                         \
                        .nargs =3D COUNT_ARGS(__VA_ARGS__),       \
                        .args =3D { __VA_ARGS__ },                \
                },                                              \
        struct fwnode_handle *:                                 \
                (const struct software_node_ref_args) {         \
                        .fwnode =3D _ref,                         \
                        .nargs =3D COUNT_ARGS(__VA_ARGS__),       \
                        .args =3D { __VA_ARGS__ },                \
                }                                               \
        )


But this fails like this:

In file included from ./include/linux/acpi.h:16,
                 from drivers/reset/core.c:8:
drivers/reset/core.c: In function =E2=80=98__reset_add_reset_gpio_device=E2=
=80=99:
drivers/reset/core.c:958:52: error: initialization of =E2=80=98const struct
software_node *=E2=80=99 from incompatible pointer type =E2=80=98struct fwn=
ode_handle
*=E2=80=99 [-Wincompatible-pointer-types]
  958 |                                                    parent->fwnode,
      |                                                    ^~~~~~
./include/linux/property.h:374:35: note: in definition of macro
=E2=80=98__SOFTWARE_NODE_REF=E2=80=99
  374 |                         .swnode =3D _ref,                         \

So the right branch is not selected. How exactly would you use it here?

Bart

