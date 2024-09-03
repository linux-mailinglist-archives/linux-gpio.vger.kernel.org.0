Return-Path: <linux-gpio+bounces-9625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F991969B19
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 13:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826271C23A64
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 11:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7311A42A4;
	Tue,  3 Sep 2024 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrSEZjKS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139B1A42A8;
	Tue,  3 Sep 2024 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361503; cv=none; b=hCCGbbc456Og2F9QEgsdszWaS6MVdlXfqJO1QyQ+2qcnlXsJRpPgq9MjCMs51bX+xjm/3hY252QjnzonDGnCu5uC32AuIB64auXqy/IfBXU1X33BKSO9A29e89uatTEAnXYaIehef6pPnPntaj7odCkhrko2NmLuShnNHdXCJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361503; c=relaxed/simple;
	bh=ABDDHRZiPPWob2a1oKRBnP60wo2gShpt8fRqa4C90kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PltTVIB7mAcmWdvu/g4HYCKqbaWhl0MWEF3WqgXLKDQrpxBD0fI4S1jcmMNibbKeq/NCXCypZk/fzqd9ldjAwW5tTewQRMB9e1RSfShtXRTESFJ4juLGyD6EkeBhxUaU/DVDx41ZEv++BHl8H6vLIpuPJWDq8nqUgHoPfAhe0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrSEZjKS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86b46c4831so571443966b.1;
        Tue, 03 Sep 2024 04:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725361500; x=1725966300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ/JGKDAwl3WrmJHCFXW8BRnwfLf9QWi2XX4xMHcFbw=;
        b=OrSEZjKSHKpM97NcEGhkvds1RyQPODZBtvfUQ4soEZ3O1zK/sToVCCbj8JEwmVzMhW
         CQmo54k4wo5Q/ltxDxuU6YzIPTtMRSvYu6Stqvdj7aH/JpHbGpzD9TRP7Fj+YJT/oUwm
         u4qyIOf+AZzeEnA85Bssuzuv5PcPirxSF6u6B+7CbL4XEjJBx6B4Yh1cPFWDV1E6hmd5
         mHcaGIESwsfnD/X4tRu9XEH4qhoeDGqswtdrexX2FMrVfC85Mj+V34wamrxT72cmKKDQ
         a8DBS1tTHB+TFxBnLM8BauuUl6gGU6yYr0ZRpkpkp/Uu4EczoZeMOX01XTB2egRHAqO3
         qK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361500; x=1725966300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQ/JGKDAwl3WrmJHCFXW8BRnwfLf9QWi2XX4xMHcFbw=;
        b=wGmhqrl3mTj6jQK54rFFYAMT7r/5dv32yTmtalVVulU0q6Kur75XXdhXCKvzkpM7Dl
         O328GUOldtdlBiJzrjOZEY0aw++AJUXDse4JMqwqBpIJJ1UWeWWcVGLUL1OVsD7FPZoY
         lgU7Gfk6lIXh+Ly95VCCa11S+kCa5q4VJm+CoDYMLntcTV5I3JNnckB9qMWbrYQ5Zabh
         ah1n0yBNf1sqzY29N8mq5EcsY+QtQ9OejbrdeXQc6MfQNkKapre9m6AMrhGaDllBssVS
         teVhNnWWm2T+HNkzwDTLVZvQTdVhhAALQnw6i9KyTbO/uoAt25kYSHWgH8eHCAiDxPDN
         8/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPRIEEzST42fvgRPFkGuQ+uigt8BO+sq85f+4P3uRAXpLWSvgyZJgO19v8D1tuldiO7REZB6CnOj2Q0b56@vger.kernel.org, AJvYcCV+U9JEMstHziVCljbbe4y3BAAcxieQ+9/tqYQ6doFGi/gUU1o4LfR55l5ziByFXgn2tch9D7L5OjCf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Fp/Ubeb/zDLNtlLosSoPI9+cvZWVdDO+GjvDLh603TX3I6nX
	06F4fJPJutphB+LrnnuURrJYZs568Jn/178b0gjY6fx6EAemKF8OhkL6EZhFQ2iWNslEu/PvzTV
	uGmDOZmLY1wETOg6ZIEj969oo6mE=
X-Google-Smtp-Source: AGHT+IEkAAm8lugKXCnZcm4zZEeQ4KtP78iZ1nEcg/zictRZjZygLkhQBC/F1HoP2mI6jCIu3ZZnXAEw+Da26HBL/q4=
X-Received: by 2002:a17:907:3e0e:b0:a86:842a:104a with SMTP id
 a640c23a62f3a-a89d8ab4b6dmr475835566b.57.1725361500298; Tue, 03 Sep 2024
 04:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902141607.2694988-1-andriy.shevchenko@linux.intel.com> <20240903045706.GY1532424@black.fi.intel.com>
In-Reply-To: <20240903045706.GY1532424@black.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 14:04:23 +0300
Message-ID: <CAHp75VcF=bnD94xFDC06knZBU=NyArwj5Yh2qaa=T5mGyuPK1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Constify struct intel_pinctrl parameter
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:57=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Sep 02, 2024 at 05:15:11PM +0300, Andy Shevchenko wrote:
> > -static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl,
> > +static void __iomem *intel_get_padcfg(const struct intel_pinctrl *pctr=
l,
> >                                     unsigned int pin, unsigned int reg)
>
> This is not good. You take const pointer but return non-const inside
> that struct. I don't think we should "change" the constness this way.

I see. I will double check this. Thank you for reviewing this!

> All changes that take const pointer and return scalar are fine, though
> (did not check all of them).



--=20
With Best Regards,
Andy Shevchenko

