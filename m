Return-Path: <linux-gpio+bounces-5067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1889831C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 10:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D851C220EC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 08:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712E26BB52;
	Thu,  4 Apr 2024 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVCViixq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C80692FC
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219006; cv=none; b=uXfVafsCev/Gg4yB9pw2AQM0C/XWWG8vrn79pagaX7lsdAdPSZ4sTkR/+4bRvN/SNCm/lkTm2KPbHj7GkWOVfqJvtknxPc3rKQlWePWQN/URy3JTHr0UX6mA3pQVIpWT+ypNOpF+/zJd0WjEUYybtfgOjIzJll0dTLuGlrT+0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219006; c=relaxed/simple;
	bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYqIFqmP8iTvF8cL8bO/i1FusVMVEDxFsn9IHu9LqZt5l/Y76Tj5C0ITsQr8xrCITujligc1jMxBMGZUkTWjAxxc6JjBouMTUhbu40vxUwERdgBLI38C5lK3CN/abFCrVgQrA5C7xFgpA6SwUMf5q3a1aEf+NynumZIfys84+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVCViixq; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so825402276.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712219004; x=1712823804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=;
        b=QVCViixqjofNKCz81WTazTp1kChJdJbdSxaCANTWnqo+9yS2nzE1Q445ZsofG4O9+Z
         QW7QEjaUyK+1qd+te45AhCxTkTv8TG6ObhOso9wJUfpvcsOmEIqi2BPKXj3Rbz69+gBh
         mlVjt70kPzoRbVSq8pyakOGPtVOz93llz619c95bXcpjxEieZSeKcS/OQvZJ9wpvoamd
         /DziaJCbqIp/LIwLOhMODPDVG0I+glQI66wDgGkrYHBcP2zz0/I9FKtegsVKTzUE9rdg
         hzFMXkU88/lt+16BP/xvHYM1FeV48LQlebR69F00MNfmBitYxuRC7YJbuXXQemKrrsbb
         +5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712219004; x=1712823804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=;
        b=Hn1sDqkrNFslbHxDUlWXmkRn0EAe8Q2djqqXbxUoWRrQqQ++9DiMNGVOkE9CZjGtbC
         Vw04W79OERDANtrXJLTPPfl8GxvSwVlDz1I75FpA7ReDCzdSyQkahy/zUk2u1t2GFZm2
         6iLVhOGJ48VncXQlJ0nM+nLZL1j8VxYNoCT06SeLdmIHpqt8QVA1Y1Ixb9H+ebU5ngDr
         CoUHsr5ygFiMCIl/G1zy3We3TIOeNZiAhrvTBNqd99cSXTZrsom+X5XdakhblQYC7w1U
         cNecX8wBp0tGavVDraWsFl5zKU9oHvMQxp+MyqhYLnSVOHY19hVhFPE+pyZQgV+Nt4H5
         RmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdzkpObbZ/9CKTQlyR0qQ3ijc2frrk3JMlckIAzEjZhd0kWtGTJudVReT3Ebub9MuvpFo73SiRc+OzhoT0cYjk8fPRLNWMyUP4kg==
X-Gm-Message-State: AOJu0YwPz3nmYE3uyds3kFSX4PQwahZSkwoaDcQYIz57G2BaT3vRzsqE
	PgMXBN5PGt9nB/hpmU5JYtSR2Z0f8ivGR4a1Eu3A2ECxQUJ2jGUL/zjAMcIcedYMTcaF/1Zxk8H
	7Au3NjxnALaAGvFUcArfVEHgEYEoj6Opx1LTU2g==
X-Google-Smtp-Source: AGHT+IESU9WLa3h8aZDesnqNiyXJbZj+fNufrMd2QMdK0OU/9kP3JNABg1ywIrSqCK1qb7HDwP4jhkHml0tcg8LZkz4=
X-Received: by 2002:a05:6902:c09:b0:dcc:375:2257 with SMTP id
 fs9-20020a0569020c0900b00dcc03752257mr2023598ybb.0.1712219003651; Thu, 04 Apr
 2024 01:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327091336.3434141-1-wenst@chromium.org>
In-Reply-To: <20240327091336.3434141-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 10:23:11 +0200
Message-ID: <CACRpkdYi=3ZYVQGAAwJ5iYNX-WY1OPTX_xuP3H-xJj9Q+b+RRw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: mediatek: paris: More pin config cleanups
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 10:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:

> Here are a couple more pin config cleanups for the MediaTek paris
> pinctrl driver library.
>
> Patch 1 fixes readback of PIN_CONFIG_INPUT_SCHMITT_ENABLE. The function
> was passing back the disabled state incorrectly.
>
> Patch 2 reworks support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE, following
> discussions on the bcm2835/bcm2711 pinctrl drivers [1]. The driver is
> made to follow the definitions of each option as described in the DT
> bindings and pinctrl core.
>
> Please have a look and merge if possible.

Patches applied for fixes, it looks like pretty urgent stuff, yet no feedba=
ck
from maintainers for a week so I applied it.

Yours,
Linus Walleij

