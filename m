Return-Path: <linux-gpio+bounces-2663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E048C83F23E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A93B28248E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB43521A13;
	Sat, 27 Jan 2024 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pz3t44NH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A59224C4
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398653; cv=none; b=pmovDBqnzyOMVMkMfkDgjiOZdHUPeNws1m1x5bhIZvJP86IBi6mbSDZLWh+tcrRL1KNCIQdNWFUKOrLIWNrLfBFOUI07xhTe8aL+lM53/pUs5cvGVsLCqaXprbKA63ggVVeL8ivJI+loQpZsXrzXfAENLPlXqtAtlW/UevSKOwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398653; c=relaxed/simple;
	bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qus+lriwwlhAla17VKglGvFEkzQCy/w3wu+5oIZnPJiktYvW0OFRkvva2mIRQaST2l0z4hhKIaudA+p39Vpdu0JBGUpBhZ/5xgtkV7jrTLmFJQOMx8EZG0bFHsjlhxvrOF08LLKRXQVFzE/T5SfOu83pqQQ7mdbaTM6N2bHMQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pz3t44NH; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2142ef4a7feso1161274fac.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 15:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398651; x=1707003451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=;
        b=Pz3t44NHws+MW6CPKZkXfaUZxr5+ibUMP/khUegDU+QMX419n60XIKmM2OlyACmt/K
         2nF0ffY674tqINF1lgjv34C9B9zDHb/XczUJcI16706Lxk/+GO1BLNdyQVItEi9jyFbJ
         82/9DnwAKHzXxwDMRsWM1vCQgmPg9DC4qGEnyVlsVG5DwII0z0lC2OHWZVw1MwJiZTCT
         G9MdzhlIMbncS8sO/m0OVkzZpp3aNj7mWyrUrFQpLIjVUcEKwUHVozoz83EKHsOAQuy7
         3e9vLgFJYlfYDAnFU98wEBje6DGt68kHyxSPYNFB/ET3A77MZoJzVeMDM4kYmagd744v
         cD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398651; x=1707003451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=;
        b=Lu6lMtIBHRDhPkyZIdLbkzHs+3fAM8NxnORNIMr6g2BqzcGnmbGg1sqSYl22rImhLB
         rcwKfn9PiK9FaoTBemYzasrXZQu8ywOXQu0AzHthrJWQu3KZg3d3QZ9C4w+E7HxboM03
         KIgqPERCBcOG5TqW+1gEJ/hPjs/UExTtrj4Kqpbe7ZvgqjqbHS5/sYAz3VqfxpratBA9
         9VW3SzJBynY/fDZLaXcyBio7ZAU6rlVpyXgv39giqEGkEc9TOmeFwI048aCx3zKR79gB
         ybn+k4A2z+JFGe8/XHerAZtI7BA8CEPrjq0GruTp9WCsDk+Mvc/l4MO+7F7RxxW7Ymtn
         fiTA==
X-Gm-Message-State: AOJu0Yz7ZP8YzoKMbeAm3DYmTX5OCo3a25TGRcpUTK1LAD3xyp1vSnIr
	6dipU9DUvo9o8mnVMJIl2V0wkZGq3DFqpNfniPyNcr7el9Sgcd0/svg23c7xM+ojPL+RfhY0GgV
	rYYiqcaYDXSnW/IEGGYLiVTbsgpJPXZHcbzIiSg==
X-Google-Smtp-Source: AGHT+IFs1SEre5NR+L5aDvXgbQuHgUDG6N0Y5iH1sPtUeHn1yOVyVhTtmjBICXXTiujpD+0Wo9kngI/E6d4tsay4770=
X-Received: by 2002:a05:6358:24a6:b0:176:351:377 with SMTP id
 m38-20020a05635824a600b0017603510377mr1356541rwc.38.1706398650988; Sat, 27
 Jan 2024 15:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111045126.13768-1-rdunlap@infradead.org>
In-Reply-To: <20240111045126.13768-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:37:20 +0100
Message-ID: <CACRpkdau1QDDCWviEd_aLqokesFutDeorAbWgVYTW09bA9mdZw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mt7986: excise kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 5:51=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Fix kernel-doc warnings for enum (anonymous): the enum values are not
> documented, so don't indicate that the comment contains kernel-doc
> notation.
>
> pinctrl-mt7986.c:68: warning: Enum value 'GPIO_BASE' not described in enu=
m '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RT_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RB_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LT_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LB_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TR_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TL_BASE' not described in=
 enum '(anonymous)'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312110210.x3vxq42A-lkp@i=
ntel.com/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Patch applied.

Yours.
Linus Walleij

