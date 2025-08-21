Return-Path: <linux-gpio+bounces-24736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA00B2F73B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8FB189E81D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0E33054DA;
	Thu, 21 Aug 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeTlcgdw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618472DFA48
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777240; cv=none; b=lhsMeBKbvdEHkP1vrMxnkspt+HCDFsBiT1NqvX951KviAwjaNLAU70Mp7U+r5pac3xZysVsW/JH2r2AA6s5cBet8eNNPS8dutu2NKA3Ts+NBLekGdlDeglGbNiOYrxeMLzMmsMt1NFM0YITAvA/9QQJXNpAXe8SQUAdE4YHb49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777240; c=relaxed/simple;
	bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4eredic0DU8+YkhSC7fGGjrTv75d8Qm3hElZjPqxbBnZxGKMJWJeCy07P1EWYKX3S8VMixNoCVkQlQQuuTEhZEs6EzZlJGQG5g5IbPGUsPJbeKaeLZlMlOyJa197yiu5PdaqxJl0eFWb+eUvwSZreMUZOAv0ONgY2KQ/nQMyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeTlcgdw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333e7517adcso18494941fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777236; x=1756382036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=EeTlcgdwYygVPvWzZ81l5IByZT3GZgdfLnceLEVRtnLKn5kjZAK18d9RTZKllNN3R9
         UXNJuNZYhZL2/q7EIlmuqT/RNnXonu0xTXfM7Mu1hvzHJXxGStRwQ8wUjUvu1nmWe5kJ
         bOvHqJiyfkTBFnPalQCG/zkNmCKpV4C//WOnsggDAKiSq2dxxWaUdzQDpOv4icRLO6jy
         FLT1i4qApSx7t3oDdCbKZI6Uo/XCgFeugJGvh4s4McwDReUaIaDZCi4GNX1+YPb88r4q
         FyMPyu6OD1xEbix9HWqrFIy2K24Qt+lvmhMkS4VLBb67YbyhwsoovUIdJ3elz5ONpvok
         A3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777236; x=1756382036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=uHB/zsArXBq7GCBYadWoFKZvBRMnqY0ARROJDTPQvrcvqTzmlcwT8QH9rcjlyoIFZs
         tWhCYfoJI/UAhID7J53BaxMlPdIlUmF6oAHt031J9J+Jjq1fwLsuNbczgaKIdBaPi9Ah
         XaxR+l7nKKFJZQgBQ/jxwoPI2yw3eip+OohdGn8EhWyiDBMMPvQZFvnRYQOvQ9luQ7jd
         de61Ux5kPZRViTqR+nAVoe+1C7rpOSfE5MZS7MnZOB8MVyOwT0d9Z1BkfzGgVlkx1l4f
         PzOf/uRh7ybXUbMwJ2vy+MHKRvgyVaxGoKx4qhXpYU3vlNByr5dzYeq/sUxMt+fQ+qU+
         ZoAA==
X-Forwarded-Encrypted: i=1; AJvYcCX6ytE+8WO7II6RAEMbIx27w0vNaKNtY48vGgrjJqmWXqUZXk7WmYmh9K7bbQEpxTpyq75MKKDf83Mr@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmthp7JGdRFOh8JFHX4TwsfGyqJXJRcuV9UCWWefipBbJmKwd
	R5zfVkY3d8ZtRbogJyDBiH/px+bKz9x2UcwgSswYbL0rC7z4w+N9L+XiD7nnw2YKkUsKMlZACxi
	mn4k4+NstlxOxc5kE3LdMTRUv1Gk6zjgnRQcRFZXS9g==
X-Gm-Gg: ASbGnctWBhmvj1Ev+0ztNeb+HWB79TsppX/i8+Nfz8FyMoO5tX7w6nH1pZqu1YL2lfs
	/HiS16IMwpgiL/omIHKg15bkZXE1Ql1Gl6nyUV0JPy0WqgqnLxYytp3NIZDdB5twGdrpl9CESpG
	5YLnzTo1V3WM8VQhEm8ZUah5hnGh8dx8N7N8tPQ9x/o3zAK2JkCP+Zbgw8OQX3Jf8WPywwmlVJs
	jnvUAs=
X-Google-Smtp-Source: AGHT+IFoewdvNuLwpOMDi7tPmb9FEQKLI5JEdERuyolhueuXHZ2+5KnKdkT/j3cc2QMbmt8jG7ipw7ObSBOoHSZHVLc=
X-Received: by 2002:a2e:a013:0:b0:332:2d5c:e171 with SMTP id
 38308e7fff4ca-3354a275fd8mr4061531fa.11.1755777236482; Thu, 21 Aug 2025
 04:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-10-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:53:45 +0200
X-Gm-Features: Ac12FXy1SuiUzS280qDRSJHcA_2jVr4y-FjGItB1ru8eWVK-JVnc9Ql5XGWxM9c
Message-ID: <CACRpkdbVqNpz2HiAz+_vFUkDy1TE6ZDxp6X2g9rRWAt4s=jRgw@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 7:16=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

