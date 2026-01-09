Return-Path: <linux-gpio+bounces-30317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED0D0842B
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 620CF3059659
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6573596E1;
	Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR79fTbk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD73590CA
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951245; cv=none; b=eWwo/bZFr1KM95IVqH5CEKMCSDI9nO47SfQvtuq7Ui+IC9Iqxf+o2LDQOgt190eDTXUlPSvBYDLKcxXXJ/1KHkot2t1zX0X2KFi9bZV1xp5UeT9F9LaKe0U/S2iK8PHyot/NCGhZwfi/T3koxs/ERHKCFLPBuMMXlcShkMSjahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951245; c=relaxed/simple;
	bh=eOPj6csaxqSh/pD94Xiow8fswoPt4epubaYlDPDsNMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrT2Cho4dPhVnK612hVtJAXUoxviYN92hnyqjrN65QJ/V8GCYa8/zGzBNH5hWKMAX/53OTtCRV8ju+88BVTtPRHh/oUry498FZ7+H3mkB54+vzctnr0a04X7GlhVEAFJx/9MHwZI4vhROuKXmCHLnjVa5W/KQHUgzwmeMSfmaV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR79fTbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243E2C2BCB0
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951245;
	bh=eOPj6csaxqSh/pD94Xiow8fswoPt4epubaYlDPDsNMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lR79fTbkQsjgiDlA6fkXm7nFk8wVuLWHxfCcZhKMCzk6nFbpiobQdH+19xNX1Edq8
	 Xu5QeqrJLJmlalUk0cX4DpHpHY9k1VxZ9yB7U7Fe08DVHs5dkYebQbpdDXSk1uGuMs
	 3NYEBRMjDXEQ7EyKut2fYDHiQqGOmhTyuFTWnsUWJnC8lAwsVSYvpIYCNB7FLTDCS9
	 C4J4iJ2k1oQ1yXqnsNmHma70GA7ZUgrFAVWtMfhy0tgm/5HSq9wirt4ixPTU16Mu2c
	 +lkpNLrYinmglFCoxuv5/Pzb5FFZDnCN4e5KeD4MboWw+Xp6Yv+qC9MI6/n5qR1hfs
	 PV1vQd6HCvjWg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fb7ab7562so35832677b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwCCp7uhu36gRTrvAtyTcRkt9CyyvGbEdzOC5/54P2rvNejjeYsHIpTdp6E1QYYWzi0C2nVjZpxbTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbU6yCjn9fvDTgNRjBGrgCsqaZErc5OH5DQdwSPmW2UoYOS5vH
	LkVw4+/7UQk+ggWJDYwj7mfQ7zcPeWUUa67HVhLgTBQoLA4+SvsnsNd7EGtrkCBR/7rUpC/bTuQ
	tFyzIieYuJM4sUijERJDhIDE5L9ZtTJk=
X-Google-Smtp-Source: AGHT+IEn0vqdkw8bEaFTh2evg/3/Gk5M0wvdcElU6mMy3Wg7wsSj3AKZVzV8/gWPdmB4yzqWtFjvi9yu72g/ac8yxEo=
X-Received: by 2002:a05:690c:18:b0:789:2be7:ae80 with SMTP id
 00721157ae682-790b582a8f8mr187013807b3.54.1767951244425; Fri, 09 Jan 2026
 01:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:33:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh3gljFKlGTGVVG8Mveu2qlxxn_p3yMb-Bc-OOzKbAyx_Ef35y9X6nAS98
Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMR=
m8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

