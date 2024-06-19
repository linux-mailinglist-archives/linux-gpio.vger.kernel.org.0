Return-Path: <linux-gpio+bounces-7567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4388D90F890
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 23:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34BA21C226FC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 21:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F373D15A87E;
	Wed, 19 Jun 2024 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b="a9kVoKZq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11755884
	for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832988; cv=none; b=rHHluBBW3ePBeVQdhg8puM8hO3SRxoRSMcHQUpLHa8AoLj86d2GnE8UmBAzWFddMfp/lUzoeuHTkfDkrazLEHb/Md6NPyc/07KKn3CzXwHPIMGNOdNz00+K+9u9cOwyKLULPVrvheqRodCoeWyPOwH4zrHwQGzrNZu7QTNc3OYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832988; c=relaxed/simple;
	bh=yVQMRhybdT8CTUt7RRtdKBm3DIo64iIkCOZP5gIzPp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clSLBJhI10UvpKs0LGoBCWhikBAQWLikLM+pxm6kNixOrNaVRSUnXvfIvficbmAOxvXiUYXePO9pjlJTFmIcIS2y3KBPo/I9HNmljEZHZ2er2IhTd08GKnTqoVzVMum6haMhCo1CwTKorVxnf0JFJwr+iKk3ySVlLslcuB2WgNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is; spf=pass smtp.mailfrom=yngvason.is; dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b=a9kVoKZq; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yngvason.is
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62ce53782f4so1739527b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jun 2024 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1718832985; x=1719437785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVQMRhybdT8CTUt7RRtdKBm3DIo64iIkCOZP5gIzPp4=;
        b=a9kVoKZqg05J6YSJomVumTGeisP5rSC0TWwT318zneXirssI+ssBWVWeQWRlxUQ6Ed
         fR/cVNenuHGMfgUUWGtHNNS2bD1OHE6CKd/RL9i2mvZ6T/NerRtTTn+7mkOXisEPtDTb
         3pDlMzUMbaF/7yaXkF18HeDNwLT3A+tnZ5hac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718832985; x=1719437785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVQMRhybdT8CTUt7RRtdKBm3DIo64iIkCOZP5gIzPp4=;
        b=oVfgRpSjZhExY9DqnFBJAtR3TfUyLC9H9Lpl5nhnJ13T+gI9ra6wDGgrDQY/ppEaPp
         0qb1HdOJaW1rMBif4dicMM1254Dcjw/l2KJ1FhB2hJ+f7L4GIq5Cor6CqE1RF0wTFnG2
         x/azdQghj+joRrsNVdeKdwnf4e5Q9XFNd10sqH/egHN4q8cRmqBQPJVp1F41/+/xPqoB
         0Ai+OxnsPA5kjTu1CNaPISXy6w1zfjQ9Tr0T+tiKC4IR6UQUbjdeEFSbzK0MUuEA7lKL
         wyVZ03VlK6VH2RvcK/jVxZzW6WaUeEHkwnRt2XGVPXUVlnqAkA+DxbRQBydVHCU7S9nd
         TNQw==
X-Forwarded-Encrypted: i=1; AJvYcCW8v6xWoGqlwMfBSjmtuc7P+TVYk0ewQNgPDKBhYqBd15V6BoEGcnikdtmvmERWcvgiTJvv++wQrw048K2Z3n1NFJEYe2OZHKMXfA==
X-Gm-Message-State: AOJu0YymFM176IFS4Ascz90ECDnmZRvBM3Tfw8Gvle4s/RXUYJuj4P8n
	2Zwk1PQD+gK8O4G0kkFF3cnfQns5kMQ350SAoXA1wfphcEkKpNnrdlmtDR88dvcgwsPtW4QzkXz
	6yLGV82TNIOwW+r/6g9IA+8CFMTTro8FAb9qqFs0biiWg6fNHLkw=
X-Google-Smtp-Source: AGHT+IFbrZhB17tMbJXo/kS5KH5F1jx0dhkE+VFMxLLMfPJweVW1mC4EOZBEu10v5KzWUHegNzkUnZh88aAF9X3QNgk=
X-Received: by 2002:a81:b047:0:b0:615:bb7:d59c with SMTP id
 00721157ae682-63a8def608dmr40309507b3.22.1718832985425; Wed, 19 Jun 2024
 14:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFNQBQzOZhOns6EfO9XJP3f=e0h8E=PBVxFxaC3QZsbBqiRh0A@mail.gmail.com>
 <CAHp75VfGW8by7UW04x7ciqQnVPGL_nOKHrEn7vhb+WC40pWm3w@mail.gmail.com>
In-Reply-To: <CAHp75VfGW8by7UW04x7ciqQnVPGL_nOKHrEn7vhb+WC40pWm3w@mail.gmail.com>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 19 Jun 2024 21:35:49 +0000
Message-ID: <CAFNQBQyg-oR+RZVCWnGCLRC922ZET0AN-44BWd-695BBvjeYiw@mail.gmail.com>
Subject: Re: Wrong GPIO mapping for Alder Lake U?
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

mi=C3=B0., 19. j=C3=BAn. 2024 kl. 19:18 skrifa=C3=B0i Andy Shevchenko
<andy.shevchenko@gmail.com>:
>
> On Wed, Jun 19, 2024 at 2:31=E2=80=AFPM Andri Yngvason <andri@yngvason.is=
> wrote:
> >
> > Hi,
> >
> > I'm trying to use GPIO on an Alder Lake U processor with a ACPI device
> > id INTC1055.
> >
> > Commit 0e793a4e283487378e9a5b7db37bc1781bc72fd7 added this device id
> > to drivers/pinctrl/intel/pinctrl-tigerlake.c and states that Alder
> > Lake P uses the same PCH. However, I am having a very hard time
> > matching pin names from the schematics that I was given with names in
> > the source file or with names from the dataheet for P-PCH 500.
> >
> > Based on Intel's web page [1], I have been able to ascertain that
> > Alder Lake U has P-PCH 600, for which the pin names in the datasheet
> > do indeed match what I see on my schematics.
> >
> > Is it correct to conclude that this is simply wrong as is?
>
> TL:DR; Do you have any issues in practice with any of the GPIOs on
> this board? If not, then there are no problems with the code :-)
>
> The Linux ideology of device drivers is to avoid code duplication.
> Since we have the same IP, we reuse the driver, however in the
> original one the pin names were used for different PCH. So, if the
> issue is only with the naming, you need to find a mapping between
> schematics and the standard form of GPP_X_nn (where 'X' is a group
> name, and 'nn' is the relative number of the pin) that is used in all
> of those chips. You may follow the comments in the code which starts
> the groups of pins followed by the pin names and numbers. As long as
> you know the basic (or "normalized") form of the pin you may easily
> associate it with Linux pin number via the source of the driver.

Thanks. I can work with that.

Maybe you've already thought of this, but if the pins all used the
canonical names in the first place, they'd be correct for any PCH with
the same IP. Of course, you can't change it now, but it's an idea for
future pinctrls.

Thanks,
Andri

