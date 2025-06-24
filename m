Return-Path: <linux-gpio+bounces-22092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D2AE6FB6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A30267AF9B7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D092ED15A;
	Tue, 24 Jun 2025 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCX4X74J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FA2E88A2
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793658; cv=none; b=erbYRGZ6vRHVIyQal8bjQUjUajhbS2dRG9ZSTv/Rt7P/iINDWq4iXxtApYHJlzg7Slp05i1ESCvo7qNR5w4DHkuGOFyKKyd7kVPXiNwrA5SIbIQEgU6gzo5/V3Mr0CxkBXYz4nzARQCTlVBTBAsLukV4pJuT/wkpE1Ope9vgQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793658; c=relaxed/simple;
	bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1SyUXkv5kxY+wJy13Q/w3+eNGUdDjiPn8CmULwr0JaFEYdpDi5HiNIo1t9zZG2z0defz/5r6f/txif6Lf8MEnFdxMDZDBo5eYT03TOVQrc+mCnAAqOuStdd5vqvW+0ZIpmGaX/UfUlLT2xfbaCT5olV7O0UlYixMyU6rKj97nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCX4X74J; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so231095e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793653; x=1751398453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
        b=DCX4X74JVMuAPITdgoKzQmqcHbzTiJdrEcpATelj5KGS13vHXMXT6Vw3CzalD+eD1y
         y3XkIjzGRvFEMzdV9ONk59F4F5dFR0A0SmK7/f9x/0udNVzZ0YMpxCNzTk3U1g6qD1aQ
         Y+zSpqX1T7N/bX7eh/o7a6w6En8/y4m+vz7tA25WAV0QwBSG6ZnIz9mfOQaQbQ38l5vX
         oOiNVgwoDIBnWEmpD3LWWzthbe1p/ApsYZJ1dtruXlK747BLQ8KD4YpiYRRhJEPwhJle
         TP9OtxjE06IbrSxcgOIIO0pkMCsN6Pskbo9GUAVgFeH92N2oNQzba6lWd49/RvudsMO5
         Sl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793653; x=1751398453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU3KO1L0t1fcR/rV6xWKqb1UBI7JX/TLS2TMN1o0VCU=;
        b=OgxrkfFQaaTJtqEyMDA9f7dO6/ySNn1WGvx7yOAk45U4OcCUv8l1G+feODig1DslHr
         w5UoQ4h+33Dmmb/8H7CdlgFp3YFs1hW9u7m+Txk8x4W7K1okXK1Wg3NitQH0y4flXiZc
         syJrOOZND5B6e3LxTYFMFvkkMlbLITVbn3v2QkKVKpG8CZJQBS1i7yG7rWWibT0LmFyg
         CAlAFmDDXLLxsTK4Aq6XGUGnDO1WC2UbYSxmYl6PHhnJdSiuomXf9y/PJjV4Y0ceF3tn
         pORyKmI6DPCAGwOH1Aw0hm+wmdWrDT6uJPkmhSMo++VLop6TmzmJxfxLcpjBg6izLDvc
         w9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLHVlgGjykwFP1lT6SKvmHgKZBxgOd48rNWqqsvXqyE6ZbPeXqyeKu5ICTLi2ptcq0Anv1Z1Smq01s@vger.kernel.org
X-Gm-Message-State: AOJu0YztQcTul9NlQH11UvFFxkClc6fJkbEMBlxX4lwVUrV9cC5gyTVT
	3GUhaQGqdgvqluIDBRVtfDXiwRZDWGPgR6ZwOZaDjSJXHVDJdWbt/clUOWgkx6jEnNxhHojJtDs
	G5xY2YdxboYMA2sFtEgbdaByUU9bJFRfIb/SnW5BWyg==
X-Gm-Gg: ASbGncvpIc87sCNOSPDauSLgStua0vuzSs80jylS7VwtK2eJoyZhja23S56UPizBxYq
	7+5rvETXoH7weUQbRL2PlQMFWhYCIPEVVRjI9jeKr4Pl4eBZqSHaUtI3GITND4MS+YZZzaRUI+9
	8cqpAA9dXju7zv4fvgOj2fObe01s3nZIsSK5L+UY+Qsac=
X-Google-Smtp-Source: AGHT+IHl7hPSnI5mX8RLNibKiwoqKczQwNlNs+Uj/iNiYleuZcULDBMvGvOcH9ObL5jer06JWd8Ot/gTWAhZUETFSzM=
X-Received: by 2002:a05:6512:3090:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-554f584ad60mr1619230e87.0.1750793653060; Tue, 24 Jun 2025
 12:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:34:01 +0200
X-Gm-Features: AX0GCFuC7Gn3GMNbMQvgOm08cDu6dLXLn4qFkj1zBDsWaRY0kXNKc5IjwKGbBM8
Message-ID: <CACRpkdZ4HeE2hEvzo4WQ0ASRyToHrZE4yXDcNS3Yox1tb806jA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in gpiod_(un)export()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> In preparation for future commits which will make use of descriptor AND
> GPIO-device data in the same functions rename the former from data to
> desc_data separately which will make future changes smaller and easier
> to read.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

