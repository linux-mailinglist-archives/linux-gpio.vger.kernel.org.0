Return-Path: <linux-gpio+bounces-29163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25554C8F752
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 17:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8D79351414
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 16:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA01337B80;
	Thu, 27 Nov 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT2IJR3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A73335062
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259873; cv=none; b=p58LwIEUsP4/WTJh73VavJv2AitDzU8qOA9ZijfcVFE5EqO3HpfL8FyF69GqtrE0niDKWa6mgmoIAEKHa461/Jr01nitdZNqMcvvnPkEIRWfWDDjd/vik6lr2APdS3rRm3xzyERtrUm0dZqdkeTTgu5bb1veA75mrC4aYvUZRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259873; c=relaxed/simple;
	bh=ladk689p2Y8k00NfW5QpkMPZIgCI9BT8rEOH8gBzA7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekrgIUy2Sb+Jxb4rQaWHWWFjjG/CBuNwnNOojyJoR1Wu3PrdOLYpYDbiXzqnJvapodHisdrbW3l2cYZAPodRUSsuCHLG6750x/wOhmWmJvz5/dJWoWCUomShT8X6Tj1f7NwJLVqCgiXl+GIq1GehesyHLbrheLrP1AbS4YRq5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT2IJR3f; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so1771468a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259869; x=1764864669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfueEmXvJ4IoIPwxPQsIfZjF3SvSPLgK00r7p6jbi1Y=;
        b=mT2IJR3fd/M+eM2FoiS697WpBi/Y7alBWOHDWlZrU/3ow6g/Qr+q4dtUunnhHWEPuY
         EdTcGqzPfooqOP3wi4x4bduNirq5iubQ8XpyeXSFYMjTS+R46C4R1+l/ffY/gs3yzXwV
         GMEULkBncAvguu3axAitJcLlW8RqqQT4gp0ITZQxhePGfcs94zOrmhTCBb4vCpOozwAP
         F38rbW+Q+LqvIlE+UC/OBO0jkx38oryEIvR5SwoX7tXGmow1WbfWON1EglJQviPBLuX1
         UbCgaxjt4lxAjO5Opdgzaoa+440t3k9GCwu6YujEauVCRlsF+9PesHs2ospqqdVZKEE8
         K5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259869; x=1764864669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfueEmXvJ4IoIPwxPQsIfZjF3SvSPLgK00r7p6jbi1Y=;
        b=aXie1G38gV5wRD4+f00VIDhLOkY1xFIC2zDdPAeFjHnGHJzIQcpWAKyKdnm7SL8oGy
         No2a7s5Vqei1T9xGiGJ73tlMVKUrS+HRYPlQ/HqzkAG0WguxIieuhHWuG38GMWIhl+Oo
         AII4eG4pYg8bjP0B/40+ox0SQD+XtCCeUhzM+6chGXEwx2c86Al43eFs1056G/sz3C5J
         vVda5kyvJ7YiTZwiIhlTv2Wn95IY+O38wTLsAijBmuUuCPAlEAbqUfbBeoz9meS/0nGn
         eXw7k6TZBdsv2UnPd9oRnNlhzhAevCbV2TWMI9ChSrjwEf5ByZ0k/5BGnvL84wzZDR40
         NkYw==
X-Forwarded-Encrypted: i=1; AJvYcCWNABbdxTuEUNkWD7oUfQ5MpCa4Pqo08idzr/BrNjXpKv0cTbBQwCBl1XI82wfCp70QVVuFd25FJW96@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ulwgKInpjUx0slSGZnnlLKy1YyZK5C2Xdub3fPlly6N9751j
	pxys5rKBRnAN+XN2U8MC8IXgjcO57TKU5Syr/3Ky8RgDgp12S1xudck6pwHW51B+asxdgaxJ62+
	sjWRhyHOe6O24TEKgn3kuYGlZCJAKpsQ=
X-Gm-Gg: ASbGnctMpa48DojJ0j6J3hvD4fYTaA24VrCd5JftZDO6q59qA2nAznMCRIf5p56IOeN
	lwVj9EchmUlNnfF8h2l889aBCw7IokuoW7YZ3SK2JZwAvm9ks1RcdYWBgUVEpH6+OMo5hBEF6NA
	AN2AhC+wvYvikODVx0DMa1W9En40x+XjY94g8OVEvu0H5LWsEdF9VYAsKKWmJ9lesfTuT94A3m8
	pbvWcPpqc3EQPr8LD7iryqWE3N+21zJVw/5zWsccItzBKa98RT4TGSjszbcOGY9LISy2E/58kN5
	0MgSnLIprPuJXM/bXl/FoZbch8ERoeaAfWZ7bv0DxweQrZ+b551pGGl4PznhrgSDkaMCxGo=
X-Google-Smtp-Source: AGHT+IHPjmtJ0YhnFRpAFPO7FW7GDKn/qLkUS4bZYR9r/p23OTOkGfgsg/KzIYgHWXF39SKHQ7TGRXRwHtlC86TBaBo=
X-Received: by 2002:a17:907:7f1b:b0:b73:7d96:5c97 with SMTP id
 a640c23a62f3a-b76716db9aemr2424152966b.34.1764259869080; Thu, 27 Nov 2025
 08:11:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com> <20251127155452.42660-2-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-2-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:10:33 +0200
X-Gm-Features: AWmQ_bkZaNKY9PsNbF_lYOq5N8U5PsBQwE1WzozP3_OofEXzxp3swpNrRU_FPLQ
Message-ID: <CAHp75VeNtYJPmXtDfWEN3a184YXTKNems657UDeBKp4xpOGovQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mcb: Add missing modpost build support
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> mcb bus is not prepared to autoload client drivers with the data defined =
on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
>
> Add modpost build support for accessing to the mcb_table_id coded on devi=
ce
> drivers' MODULE_DEVICE_TABLE.

...

>  static const struct devtable devtable[] =3D {

>         {"cpu", SIZE_cpu_feature, do_cpu_entry},
>         {"mei", SIZE_mei_cl_device_id, do_mei_entry},
>         {"rapidio", SIZE_rio_device_id, do_rio_entry},
> +       {"mcb", SIZE_mcb_device_id, do_mcb_entry},

Perhaps squeeze it to be more ordered (yes, I know that the table is
not so ordered, but given context suggests to put it after "mei").

>         {"ulpi", SIZE_ulpi_device_id, do_ulpi_entry},
>         {"hdaudio", SIZE_hda_device_id, do_hda_entry},
>         {"sdw", SIZE_sdw_device_id, do_sdw_entry},



--=20
With Best Regards,
Andy Shevchenko

