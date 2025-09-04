Return-Path: <linux-gpio+bounces-25612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC1B44620
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 870187B4395
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D3525A2A5;
	Thu,  4 Sep 2025 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUixMibm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD949253B5C
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012794; cv=none; b=B2i2OgYC/YMmyCSw//1QG/X78xn4fkN/5V/3rJkFsraLNtp5FDHUpI7/QQfX0vmxtxfv9qP88U813pAkCHwljmvieQYlow58WUT9QEUu0m/o7S7J8hfEwI4mQePbnoxFxZTCDFZAdr/OUAnx8mqb9gbaytW+q7M0KJA53ORlON4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012794; c=relaxed/simple;
	bh=Tuz+KFsMOAKrrmksXSyxy7IQp79UcY5kj9LoG8AjN6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1VGfZhEORwnncsfG8DRX/R7ouTtLe7/sWL5frbI4YCH601WkUikY97G+vVwLOGvBAe0quXp1czKWNMVssjmIc6DQZgEYPBf32rsV9soYmp877qgsikertOlqVXq2OnL4BH4DBEO2/l7VUMJQqQNpz3RBSWS6A78Yna/4TJkU3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUixMibm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3380787b30eso12690781fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012791; x=1757617591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8MjxXtUVklH0dAHWxRN1vQ8ydXwrQhADRfamwWuTLM=;
        b=kUixMibmAxDIV/NfIpEHxFJCLuabMg1h7wUKcxQMLoWYQEzlDrPlMVq5U8N7w1E/HO
         +wno/+lPnOu06aifkAiclLCQmkBX20wOzvTBMGBWOsfaSt/atC5cfxdP4mxVIq1Q8rnF
         MguEuw3RPxvv3mGwrwKaGe3Vi6jw0ywnZ5K+Pl9ERTYlSL5GYjviB15ALeBEJd58yzcG
         2JNHti1zpMp3wr1yICrRPUq/PcUQeIr+U7Pg25yngJGLu59mGM4xGZK2KDGTW6WzZEar
         B12gT8TZFI2FWi0AIP15qJ8gK3+5rwCnuA4qjeDLADU/LmXl1pNdwjP1g3RUmwiNdsw9
         2C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012791; x=1757617591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8MjxXtUVklH0dAHWxRN1vQ8ydXwrQhADRfamwWuTLM=;
        b=MubF8xySHiziELO8R3GHk6zV0yBFt/zQQxI57POpNOH3H8LamU33de8oJGAVs9oz/7
         XZMaPdch9cU1ra8gve9xiFw1wuOX5kjhezE/l3fQIeZ3lCDOEpPAbU95MBfHrY+ty0MX
         rjCTXCRx56ypiyHI7rgJyI06nlHthFDZ18GKW/6Ltkj090NFIiiqM9P6ulxvGgyMLuqn
         Tk4mNycDdOR72JRXm0k1YXOGOAllsx+idyIOonKc1vhaMWrSBlxllH7FpIbpqV3cAfiy
         JMLj5qscszbdPbez4VU1u02SXRtyv4lqvlsrFN4p/StI4YW2oU+SH9zcR4zmyLySnQuy
         nj3w==
X-Forwarded-Encrypted: i=1; AJvYcCV6DOxKoDcR9H2iuogAuGr2Aln+WaRkQd34ZNbw23p7GJ8OM7hbEIJK6ne8K9//TjxIRN+WZ9iafNAS@vger.kernel.org
X-Gm-Message-State: AOJu0YwFu37todSwgZMw+YVDnEXwBNfJYb84qBeNZ5M8QsoOFPGb4rmP
	NYtfA3rd6Wfqr+gCv3iBAOpBQMCASDmIkE45XmPIk/pUhRGT5iaIXGQbhqXVrhNh3cPiULyRpLL
	GW1jTIgfKYxjvtDV2NO7BOV+HRGfI9EjWM48PYNC3pQ==
X-Gm-Gg: ASbGncsL/7Mf7sCa79UHC4xZu+iNT9B6+jE6bW1dhiHNQJrvkJH+dXAy9c6AIVuqwGE
	TeFkiA5FDwUapmtgkDGmYHGAJHet4qHLDptRD7fqUj/zOqOUrZHnC5U/N6qpU+gB2Bij95VZHn2
	DewqOw9ySGwnA2y9c3h9NZTXPnWxYvEYw+oTa8ylMDh6QtMf+1ZD/Wim76aDJE/aoycDJNSOeaF
	/qwIXA=
X-Google-Smtp-Source: AGHT+IGQH/PqV73GnQj1gc78jLR55x1NcYKC9gSDDsK05XB+udjTt+5qVTTdpbxwzQgx75sT54Y3S3UlxUpqsaEdbyw=
X-Received: by 2002:a05:651c:30b:b0:332:57b8:92e1 with SMTP id
 38308e7fff4ca-336ca91f4b7mr45915291fa.11.1757012790724; Thu, 04 Sep 2025
 12:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:06:19 +0200
X-Gm-Features: Ac12FXxjoi1bttOCqRb5EV_-cdL8742aaHKH_Qm1fm-mp06Nu2uHA3wUPt3kP7M
Message-ID: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Patch applied!

> +config PINCTRL_BRCMSTB
> +        tristate "Broadcom STB product line pin controller driver"
> +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)

I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
because Peter Robinson told me the Pi5 needs this driver too.
See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Yours,
Linus Walleij

