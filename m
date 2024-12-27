Return-Path: <linux-gpio+bounces-14312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB99FD5D8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F27016150E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D21F75A9;
	Fri, 27 Dec 2024 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwTOli5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2911F7596
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735315917; cv=none; b=pS20lU1JhLp7XP3kWS/+9LWvEapPLz652UM/HuWUzSz5605EvxMFQ1B95llSziV3c1Edup5vepkfz8s3nzfqzWTRrUkavp4d814kdwaJU5GjZ7G7zHnJuCGcmj89coWY9PBcej09YsFfyIvrt4N6Jnqfui9EtmOJRikfsitvwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735315917; c=relaxed/simple;
	bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elwJaVMP+X6Pge8uGWAkUFbMcyWY1XsE1oK8eB6rNE19KIyOXk1AEQqYWlcJDIAqWo4QLfDwc7rfeZakExvnjlkDU0tKG4ckT7s61mQuFWzWp+LsG/wHyr4EIDc4o/Dp31vi1O8DacC5258rPFcs33upPZhz5p7muuQvO+a2/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwTOli5z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-540218726d5so7857521e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735315914; x=1735920714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=;
        b=CwTOli5zF3ThT71os9bMnqN5iBcqWW+Ni+gIF/CVraJteI8j/7ewGnUMg4UAjYOP6k
         wD1k35NA1BZfq6otHfjxbl/ZIXpWAhhQnZW/hmcFl1kbXsqywfLoT6LzfZvZj1dTsFOZ
         ILOMlvOJ6Aa80vB19pAHB+53ofJf+O8eFSiiWYwOM9zaVDW5tH3GSY5lxE4md5XeE6+c
         K+1jRHhk2M7Y+lbSVjrJxXBSp2M50JQZlECay0TO7eR6F7wx4JSfU07YS0dZsQzfLoo1
         Ljh5Ici3xhRXG/FmepZDCXqfU9ytdW/ef/tRpRFgatcLsg8oa5gOW3UfdYL/mhfSCcvu
         wObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735315914; x=1735920714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=;
        b=cqOLRwBlPzBEQBVqOBor5bJhsq0XEgGqS3Zrzixp5qlFiJ3TK3++eBym8nPKszJ2Wv
         +ClcvazU8GXdUwf7YBy6XlFCWYWY/M4GrnDjPNvi2EYXelOutWnq9HjD4NhODO+1NFK6
         YCvncktga83+lUKgrBR+pfy3TX4E9f+LxzuQ2IW7QVBqIzAikiHivxoFfdWT7fGBLtd7
         Eg1JrXqoYuB7URVxssWzm8hYPMdPhsbLVl/s/W58zMJIr5cQPsRei1geihLoIvsgzmEG
         yAETnFbxdeM91uNlDrhWQX7p9k3NA11yQk97+16J5tqPTj5iokMCKAiseYrqZ+b0n2tZ
         umvw==
X-Forwarded-Encrypted: i=1; AJvYcCVCaE/uRHtSM7KftlxxT6+WiE4hUhfvrKx/ZDLeaUIesbmff37/iPaR6BRtcnDk+XailGVnYPb5BOqA@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHkCr2trDTRygkbQARvBe4LrEHUdvpPizvQi/gydOPLHFcRC1
	GlJLC4glsV49yCgxCRhpsq0a94fKE7k+CC0DI/AK0481exjBTfr9eyb7OrAcnZYfKeXOghsUYv3
	5z+OrCCv7TLGbaxUvbWP3BDe95jeaFo94s7X+aw==
X-Gm-Gg: ASbGncspgTVh6qzqMbt9aBIdMzBRLx6xffNPnv/GnieV8A7uqQocZbPmMZjdbwP29Ym
	kWl0C7vJ2Px9PCgYOwcACPi3I/iO0prRMsW+x
X-Google-Smtp-Source: AGHT+IEfzgrnWEv0T8X300Rwk6YsTgikGaZ2unlJL/Mp1uL2AGkGBjigq6K16TIrpmYWFmnd0L6EjwQh/s6OpeadRoU=
X-Received: by 2002:a05:6512:33c9:b0:541:1c5f:bf85 with SMTP id
 2adb3069b0e04-5422956beeemr7174420e87.50.1735315913918; Fri, 27 Dec 2024
 08:11:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224093522.3815562-1-kever.yang@rock-chips.com>
In-Reply-To: <20241224093522.3815562-1-kever.yang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:11:43 +0100
Message-ID: <CACRpkdb+3=VQiY0eHcVDcqVMpkSXY1sw_3pC6uCxQ8EZtRQp2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3562 pinctrl support
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 10:35=E2=80=AFAM Kever Yang <kever.yang@rock-chips.=
com> wrote:

> Add the compatible string for the rk3562 SoC.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

