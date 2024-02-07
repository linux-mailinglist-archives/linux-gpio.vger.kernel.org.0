Return-Path: <linux-gpio+bounces-3048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFB84C8EF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 450B91F225FE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F8A14AB4;
	Wed,  7 Feb 2024 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWtxvwZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF45171AD
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302916; cv=none; b=ijl1E4yVgTmnau8c1bFnaP27LKSr41/QTu3YgemwMqSx+1zvezgtg2/0KxLkFE6jqOWAjBFsWmxz3cJbYnZMHHYkhwd80f3cGU1NyDt7g1813sdbyWPOWCo6Adh4eWhk4VZuiqsgBOPNgMMB30nf5gmf58nKt6LRbRRlLjJ3OJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302916; c=relaxed/simple;
	bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqA70uES7h3ynYat8EokDV5KNWPlJvEYNp0nSsLj31tyEBvYmrFujTj2DYQCmwOI/bZZxCpXSo6HhjbZZHjlD11KsoHxG8HLuQbLvfw/aWU+4FhsxtKpEJv5/3HM6U/SUFtQy0gglHYXQ2a8Zk+mfV4errGwxZXguHWjnJ1fhtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWtxvwZX; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed179f0faso1176089276.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302914; x=1707907714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=;
        b=qWtxvwZXobwkpcgLQmpiCsjLIucoGXOvzXpXo/BsuM0g1YobvUrnM44k7I8cNQpaCX
         Z6/W0KaIRqHE9gY3zG8FHSKvSA8hRVpw3L2MbTDekFU9zvAAyTQ3IskpQ87AkqTijC8O
         XBS2hqsKO9gadOOJhF7r7O+0hlTDYBJbvJEnoA9yhHS1bF3mUngq+S0hqSSPnh9m0zps
         82TxwyGFE5iYF46oECYPurRusyz8XyEItJNB5mBtEyVMWWCG/IxRJmCW8RSP9nC5EwwQ
         xdiQtUNhOzvXPfSYSLGlwe/fG8TbQ/ypXBnFF8tIJ75wIZ+W5ODb3Wiohr9yQPMET9VJ
         qfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302914; x=1707907714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=;
        b=qJ4dO2iRE4uzkaMrk44ZkwJDrOh0JbQ/ivPby1/jkjUPxxyNauahzLeE1dDRwjcr5g
         PA7XH2i3UGmxm4of/PdRFutreFkVd68CfYvWkuQNpL35AVwgq9n9lmh2aHBkZhoR6kI9
         pZ7CsXzElHNP9vKqTEV3+H3Qtv6nosfB3+cFOIkp9RSdhAldX7+TJnOgGuLpXx7JqmE9
         6Xd36ZLub5otUVecNghL9j1KXHsu1pf1Za31qMhu4N6FeZwRVp+nvaRkV1fqpDmzPPwL
         wGyhwz880y7V6SoHTUlvZTcUz/A47B9JQJsqj0v4ZbFk0MR/nHFBctiSYNM6ZQfh5UTE
         tvBg==
X-Gm-Message-State: AOJu0Yx/ecNEIwsYAWK1/2p2nU7qjLDdow+X5hl5Sp97uNDk9ZY5C5/U
	ZpeNtxx2OdwwZP1XWTGKHTV9PwRkZJaOVbw2o+XBae1XkPvc60hQdvhBNpe9k1w4oCGZQB5wMHX
	4Ax3C1kMI+DG1as7yrRXXXrFseUVkOgNFApejVw==
X-Google-Smtp-Source: AGHT+IEyeEd+YmW1ElXSMWlGNBIbSjnJ686ocEUtx/vkJsI/HbYPN0Ib4cxLvb7P2uWVdDqkJpUOfJUu6YpaPjdJ3OM=
X-Received: by 2002:a05:6902:4cc:b0:dc2:58af:2af7 with SMTP id
 v12-20020a05690204cc00b00dc258af2af7mr2987912ybs.22.1707302913682; Wed, 07
 Feb 2024 02:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131071910.3950450-1-wenst@chromium.org>
In-Reply-To: <20240131071910.3950450-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:48:47 +0100
Message-ID: <CACRpkdbRY70+Er-=Xv338j68NgjEKZeD5FYW9GqFY-68sCBvgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Drop bogus slew rate register
 range for MT8186
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 8:19=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> The MT8186 does not support configuring pin slew rate. This is evident
> from both the datasheet, and the fact that the driver points the slew
> rate register range at the GPIO direction register range.
>
> Drop the bogus setting.
>
> Fixes: 8b483bda1e46 ("pinctrl: add pinctrl driver on mt8186")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patches applied!

Yours,
Linus Walleij

