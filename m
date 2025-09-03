Return-Path: <linux-gpio+bounces-25432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA5B415B6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0AB176ACB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0742D9482;
	Wed,  3 Sep 2025 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BVxBt29G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C61E2307
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882719; cv=none; b=XICQuSI9LUG/2sP7h+tf6NWWsEOHlBW8nFuigM7S+TWqNpn5ec0JCYWDMs5HctSLcBIk3xuOc8F1NmHwDLxhbrdxYS2o5jLCzI8OlYinMoO+slBkiGc65eeNUfGNHGDnhOX13m4JQn8TyQrfoCxCdsiS2IJVI1a0gdLhOEkh0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882719; c=relaxed/simple;
	bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSTIuTc7rCqwBnawQP0ACn0Vi4QMTqdd0VT/kQxNoEQ3k9ESQbfP+lm9sNljmv8MdvsLcbkTDQt4soG/u3RbN+gL/TeFryMyfg7XE6jmm/dM1vrAq23JNozO2gF7dVmGPl5xIY88IP0kjGorbK7OEDN48i82wTWMr/gxhokNPHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BVxBt29G; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5607a240c75so2889556e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756882716; x=1757487516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=;
        b=BVxBt29GXSiFBaHseqW8DOAmQQ0xtH1KcZsfrb7b+zpBNY13JQYGE5Wh0GdnPqAR/X
         asEymHSrfSX157lvVaSWAJNn2KXA6F3p+6F9NAoyWDyFQVJfQEGVjjdHR6hwG60FCKx1
         aJQGOFjIrgs/i18oS8rqntD0v0/VEsHLDbtwwTvLrRp3ygw45yrdgzbc6G+u588y6i62
         VM9G7CQ1BSmQGFA28TXfFIyOrcZrZWwVy60qCLqY7B4aiNf0gfrU1TQzYd2ZiKoxKFDr
         ibqieOcSLpbjRGTIuh9GjvIcpLh6Geuj0sWZmJansQykytMeyX3j5KVr3kVQh3DGyE71
         gdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882716; x=1757487516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvbg028o924LlAp46GQB2tjDgAbUJlME1N2hULgcBJ4=;
        b=nVU8iQZPqPM9DHt4UBP3gohHEHs4zfwzxWdeSfmSbPQ761aY9X+sHznoDJrHcIjT0c
         5CoPcw8HIY8BXA7XG2/AUs1dD9hFFqpmy/2kgwRedTLExP7ckvN8dSEehi/waf+2/RIH
         770qq5/PMmKS6rnXUmUjJEHnZ78ujHL4shXF6Qs9BBUDkiiLeINztMJ4+zygRlVvat8u
         E16pAnoxEkmHr/+BdKQb03bLH5fNNQIKSpRN21nKuIp1wFBd4eKv3IzYm5J+6d3exJO8
         XeVpsT1rGLVcc/FC7hvhkT+f6O1V6gdd52A6jOy2la51qb/v6LI7jgRBxmsos12MIIUu
         fvkg==
X-Forwarded-Encrypted: i=1; AJvYcCWsIsyA0tAhqwa6t4dosYvB5cw8ixidmdVIGiplXmD6muft+bApXFFFq5XHsPIw/2ZR0c1BHohUhobv@vger.kernel.org
X-Gm-Message-State: AOJu0YwtejqaOKfjdIoQUgya9XZ889Uc8rsN0Fu/3GVTOYyisFKJVggn
	x51+YiT5FhijMGpOUwHY6ggfqDmEff8gvJnPv6JDYjOAFMsArqXrFVRoiWL3nsWHtohPn8uHAtv
	wUUB3tJAsIXLUk7YnIPQP3xC7s1gRB1toALVP786TOA==
X-Gm-Gg: ASbGnctr48nOjJrdDSsKLnQapcgY78NsjCmA/aTpa0Ms8X1ruKyaOBZjIElbujV8470
	IKe1yzSRR21Nja7qz8eZnI7Gz5zJ/80IG5YtkCR0ZwJO37reuEdP7yshoZGPh3TUnuWNnjD7aYw
	Ulm7BE7rT4yhSgKOB2r7snfMyCIPUJhkwSF21gDsI82jICHYpB7E8D6kjNeN6isgOEdyEfboGUL
	4KuGj9PsXFDn9S3aw==
X-Google-Smtp-Source: AGHT+IH3GxfscI6GGSr/NNb7LHY9u9DqMXt7p2udpQ/Pdohy0CbQd0xJDDE+ctimHiSeoPF/quwYh4dzc17DcEr2yUM=
X-Received: by 2002:a05:6512:6702:b0:55f:486b:7e5b with SMTP id
 2adb3069b0e04-55f70995c72mr3489756e87.41.1756882716285; Tue, 02 Sep 2025
 23:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 08:58:25 +0200
X-Gm-Features: Ac12FXw-cperMlNMDgWs1JD1q73qBaU6s0VdFIuvSNEdtJCo3HZmhANsMkTdUts
Message-ID: <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
To: Andrea della Porta <andrea.porta@suse.com>
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

> The following patches add a pin control driver for the BCM2712 SoC.

I have merged the prerequisites providing .function_is_gpio(),
do you want to do any last minute changes or shall I just apply
the v4 version and fix up anything minor in the process?

Yours,
Linus Walleij

