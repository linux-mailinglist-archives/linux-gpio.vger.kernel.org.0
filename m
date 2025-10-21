Return-Path: <linux-gpio+bounces-27353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456CBF5695
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BC0E4E3025
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804B4329C40;
	Tue, 21 Oct 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tfU4V0m0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78AF1DFE26
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037601; cv=none; b=ILHqh7fGck0dzpxc+ETRKPOe8jlufFO+biHeM586V+c2hZotKmD5VWyp7vWCFvQBUgXaDYHItWWXAR0ddh6YZkkP3XvhtOWDk7XB/uNiCB1eT6lgqp1GuRA675UfynOaqMK1w6YhE6zG0TmBVjnDki0bJJQEYVXmnAOMGIJXM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037601; c=relaxed/simple;
	bh=Kw8PWnwgX+EVahNAArZWM7gjO7i4Jria4MYBSb58vsE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm0jA0/s0oAKMRg0+YA0XrIvPa8z1wkN03zUZ9RUoYak3sml72b9U1GQcDPZen7ce0zn2hYWCnngCJ5XNQMXL6fpG33c7Jhayj8pz2cY4gfJgf1LFPeb38qkpUGvOldqlW3HAcn165eiE+s9/rDFbLrG6iczKPEiM3vLT0QDpnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tfU4V0m0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-591ec7af7a1so480611e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761037598; x=1761642398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPpFx6ykYRuQv3SA/HXCy/3dmgOcOpqVjX/aVsVTlzA=;
        b=tfU4V0m0q57ZNx37L4RF0azZHlUDduWeeC9bYeHb9rdfOA1mum134AYF39DYXOiIYT
         I+vn8/fKOQ3Ss5jnpxMfjeBiJZwPTYfWw1x9lkaDZe1m/NrbyWflzd7trjvmr1779Ray
         9eEEMaR6jYRnSD+DofE1YJA1MdBqwlmNIGHyHXZd1tOaKo6SjNT05obwLiRhc17s4FMv
         ZDwKw6yKfo43zpGAPgutaBmavQSgpkqo09ByL/tp6OUwwpAoNfIj72EPsVofw5KNKlsK
         JpTM6dOj5kfVxvDAw0O81/YwmJDN3zMPEp4ff98oisA8xQkaEFiQnGQICDaEAZKJWSFZ
         1tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037598; x=1761642398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qPpFx6ykYRuQv3SA/HXCy/3dmgOcOpqVjX/aVsVTlzA=;
        b=cpo6IRBHuYZ8karSe/fCYjqRFJNfKWbEPCT6S4AwmeSer1TGROLBnnhoX+YgwlUGZK
         6I76glou75ca137vhBAEfWXisSPByR9NIlxPWnyqnCq3VEEyY7TctbYlJKLsgYQZl7a7
         RmetGUWLEFouIv79dWBfm88w43UXuDHcaaHXurBNxBh7G/0S7Cq/EQdmokdSsZ1yc3Ag
         nYFH6nuOpYjMfpsaa94N3wKoz5J9bz4F73OPA4MneQJUpfwfH0ILEuwX7F6fjb2qeCP4
         Fu3ES5XEFJjhvnSG0UWD175DMSha+mZkIZqpoLaRu9qAiLtRTAZGbaA3B7x4wnhnaylT
         EFQA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgA21LRFCmNjVAIDofMVq/PXsLx9I8hacqd5GKnLSTDu929eKuhzm8HyQymcOYnwR4VzdOEaNk/DK@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTNIZPbJbltxjaAksc116s/p5OoFMadVA3w7M3+74krGQJuA4
	0yZeh9Bkxe1aD0FnOEf/LMMO6s+ATC/FqjsonGzveA02Rs8RADr38ADWbJGXqzQLQ69giFZ/3kk
	CiwM/HqCVpzT265x0wA7QVtG+eKwl2pnKgM2eB3bxCQ==
X-Gm-Gg: ASbGncvkJyhsfIWGNt0NUMh4QsViGbpl/jGml+U0AtsAv7OnCDx2K35Cj/yN/G3Mrwx
	TRIRNBUpDofELYWcEngCIgsnLTP48yO/jdOt/951XMIaAB5xiGX32PVIh0bBfODy9Stex8m0yJD
	adVNQ+jZp/Ss6WWS9HEkDkcU8OUUv5l4s2YeQsyXQ1uojzmNNv9GNXeopP6YOq4fRKDjsF9YKlL
	DlPow/G2o6PIZ6uxqyLgpVenYiSpN8vplDoYPTZ2uQnb+dyzx9fNe5Gu4eFhP8hKU51IJ1osvyR
	HXwzSL507yrYDTcspKJWVHUqWI4=
X-Google-Smtp-Source: AGHT+IE3YtmLtzMdziyNQ1IevYP+jbdpiGOkpNCybV2U1useYtB1KfMzt3wyojS9vR+rFcn0fnnKKJYLP3lPJrg2WpI=
X-Received: by 2002:a05:6512:68d:b0:57d:a8e6:6574 with SMTP id
 2adb3069b0e04-591d8506e95mr4737920e87.20.1761037597726; Tue, 21 Oct 2025
 02:06:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Oct 2025 02:06:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Oct 2025 02:06:36 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aPcuHpYCM22NZ7S_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-3-6d3325b9af42@linaro.org>
 <aO1dBgPZfDJTsPfE@smile.fi.intel.com> <CAMRc=MfOoHn+mLRpQBEsC3g5sM=VZBgVffsm68CAXJBHffPxdA@mail.gmail.com>
 <aPYJeqFY_9YV9AQn@ashevche-desk.local> <CAMRc=McBTgnQXkPoOUYC=PDDwFXuVqfMFuiwZTW7ODb6owJbeg@mail.gmail.com>
 <aPcuHpYCM22NZ7S_@kekkonen.localdomain>
Date: Tue, 21 Oct 2025 02:06:36 -0700
X-Gm-Features: AS18NWBfQzQ4G0TaM5lf1nYCqc0Xona873xRGvt4LqOC2I4vW3KZIjQXa4Az2P0
Message-ID: <CAMRc=Me0YyBK5DtyJO4ZZvfvnhdtJx92_ktQA_eVhqFEkh=Bqg@mail.gmail.com>
Subject: Re: [PATCH 3/9] software node: allow referencing firmware nodes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Oct 2025 08:54:22 +0200, Sakari Ailus
<sakari.ailus@linux.intel.com> said:
> Hi Bartosz, Andy,
>
> On Mon, Oct 20, 2025 at 01:26:59PM +0200, Bartosz Golaszewski wrote:
>> On Mon, Oct 20, 2025 at 12:05=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>> >
>> > > >
>> > > > Can't we always have an fwnode reference?
>> > >
>> > > Unfortunately no. A const struct software_node is not yet a full
>> > > fwnode, it's just a template that becomes an actual firmware node wh=
en
>> > > it's registered with the swnode framework. However in order to allow
>> > > creating a graph of software nodes before we register them, we need =
a
>> > > way to reference those templates and then look them up internally in
>> > > swnode code.
>> >
>> > Strange that you need this way. The IPU3 bridge driver (that creates a=
 graph of
>> > fwnodes at run-time for being consumed by the respective parts of v4l2
>> > framework) IIRC has no such issue. Why your case is different?
>> >
>>
>> From what I can tell the ipu-bridge driver only references software
>> nodes (as struct software_node) from other software nodes. I need to
>> reference ANY implementation of firmware node from a software node.
>
> Yes, the IPU bridge only references software nodes.
>
> I might use two distinct pointers instead of an union and an integer fiel=
d
> that tells which type is the right one. I don't expect more such cases
> here; it's either a software node or an fwnode handle (ACPI or OF node).
>

Like:

struct software_node_ref_args {
	const struct software_node *swnode;
	struct fwnode_handle *fwnode;
	unsigned int nargs;
	u64 args[NR_FWNODE_REFERENCE_ARGS];
};

And then if swnode is NULL then assume fwnode must not be?

I'm not sure if it's necessarily better but I don't have a strong opinion o=
n
this either.

Bartosz

