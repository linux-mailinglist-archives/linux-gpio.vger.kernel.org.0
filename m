Return-Path: <linux-gpio+bounces-17522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA5A5EE52
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5728E17CF18
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7254926157E;
	Thu, 13 Mar 2025 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FU+ufqbd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD01260A3F
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855614; cv=none; b=p3OUXmHvJAgUqnY2j/BW0I9moHF68Xq26q6DpgmztBCV+Y055ASsWiitTUCz3maYUBcY3EpdCosqms/MbVjP+QdxdAOIJ85s6j9Nlec5S5Rr+6UT2CdCbDpF41BhZtEHt6U7RpeUWnRbjT2Q1CTbTBSMtuu7+oY/FA709+D0vcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855614; c=relaxed/simple;
	bh=84qr8UHF22icVGC03VlfTXEsNs+dvTin3xAGrHiF+Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDTp8RjWCQhbGycoZv/WaqQYXxEWPDsEvrVoTB2q464IsFMJNeFwR7q/Pa+6d4aXFrj/TlfT6JAg/C0C8NTgvHUQJb1LYJ702VybpVgxfm1Ivwe6Dwdp+bbYaIJLnd3nzegK+lUuiHh66EX9gOw8UIlF2WMvYQO20smubXYv/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FU+ufqbd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso1286801a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741855611; x=1742460411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s6tQBY5W613wvnSyYaCbY7NYs6PCm3yDk8vQcFq9G4=;
        b=FU+ufqbdQ+NVVMWFzpV5r0OMgLrDt6Y7UmasFDqD/pfNSH96xtM1C7/tAsGo2apgkd
         EMva7jojd040onfvkTmjKm0coEBqm/tMIn/hpXAHrz0CuKNirTuwhjARyYH6QMNhgO8n
         gHYjV5OUEojM54f3IpDwaX73VNRaVYNFuxPrENIAdQK7H4zyo0K36IcwJyeeggIyqnN1
         cH7aqTcljv9b8+/iTbGtaNTZnv1NZsfSJrsjhxbNfW2SvocrmAcYd0tQTVKY8IsWItRR
         noySLzbYsCGFvLKboGLoD36Zzm4Ypc2Exb7vt0ZzcB9X2J9IHvZ3KxAMy3jFQtkBnm7J
         IZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855611; x=1742460411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s6tQBY5W613wvnSyYaCbY7NYs6PCm3yDk8vQcFq9G4=;
        b=eECFy2sbKwEQjZbGMzTCAw21eVPp/DZj7QsfqTqReTK/vCS3Fnh3V3b9+vvaQHgz1X
         P5ovSW72z85nFmxmVO5iA05kFsOTFSnhWXCVlJXkpAZnEsFAWeOrf4v1bxhqjiIuoEeX
         9Du07KxcMMCxRqBpqEbKGqIwNm7+7eHsTJJ4K2nS4LbUlRDyB2MeCC9Z/R2kju/lLXIe
         +jqewFVpgltNyeI+3AdUS31hXuX6OmuCwDlPcyUCAK8pXli7JMC58lPQ8zPtsYaTAMga
         9n2hAqu8qDtjV90L8nrCSe0n5dAqXRtb2kasQkkMJ8r1wuMiei9THtsWNw2zAwz1HFbc
         wQaw==
X-Gm-Message-State: AOJu0Ywm7G631oTC/rPoczPVSzHGljta0ElilYIDGuqjXZVNwRXfgh28
	M4ZJCG87K/fBhq6gAQM1mM4/gYjdsq26AKBhy45TBbfcSZoBPwSgIABIhjV1R4kWGoQb6BdCGBZ
	rwQaMAz6rjHiuB/lbe7BThHdUUEQx8/5QRZ55Eg==
X-Gm-Gg: ASbGnct/Ktv6mN+ASWNruqylTkhesr1NPvJ7zQl0rjirnzic/u7Cu1GpcjrzBsInp5I
	rA4c2Mzn5XRJw4I4PBUmDbutPyYUQUNZ0+cAnSirdjBqgSxXR+mO/0JaFtth4MzyHSAS7ekvIF0
	OdvHIH4oSTY3PnNp9vlgP4Z8BVTh/wwV/hK0MnDoTLRgTiYoIHvz4KS8VyIw==
X-Google-Smtp-Source: AGHT+IFaHk0KkmV6XgxB02h9Iawf6uH/RyBgVdtLTmhNZZiocEB8DijsENKynLkDQ5ZAVyAmKqwspFXTaObpMhv60o0=
X-Received: by 2002:a17:90b:17d0:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-2ff7ce7abc1mr36083846a91.13.1741855610889; Thu, 13 Mar 2025
 01:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9Fr2ZMczDUg35JH@black.fi.intel.com>
In-Reply-To: <Z9Fr2ZMczDUg35JH@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Mar 2025 09:46:37 +0100
X-Gm-Features: AQ5f1JqzXiVM2v-pRAXHOmH3LwP0-ZuCHCYCDcPtf1NENOQaHvKjPOuansPwt-s
Message-ID: <CAMRc=Mdnsnjd2XU2VticG+9cpwz_eKL5MsqS8iQETt6kwGZ0jQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.15-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> One of the calmest cycle for Intel GPIO and GPIO ACPI library, hence just=
 this
> little pull request for v6.15-rc1. Please, take it.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.15-1
>
> for you to fetch changes up to e646f0dae7b0f099b36d12d9cb5ca733b8273f10:
>
>   gpiolib-acpi: Drop unneeded ERR_CAST() in __acpi_find_gpio() (2025-03-0=
4 16:47:10 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v6.15-1
>
> * A cleanup to remove unneeded ERR_CAST() in GPIO ACPI library
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib-acpi:
>  -  Drop unneeded ERR_CAST() in __acpi_find_gpio()
>
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       gpiolib-acpi: Drop unneeded ERR_CAST() in __acpi_find_gpio()
>
>  drivers/gpio/gpiolib-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks, pulled!

Bartosz

