Return-Path: <linux-gpio+bounces-36617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHckHNg4AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:15:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB3515952
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60AA8303205D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B78B37F8CA;
	Mon, 11 May 2026 20:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYMGQ5SI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EB37F8AF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530239; cv=none; b=q6nE+YW04lzt2jtId4CGlwXtrcoWg4MBdNQnSi6ges4QKwCHx238UhblNEmSS7QJyLgz4GhfiRAwXI6WvdFFoBidTEGcT57Wnubp3KApXkuY6lIRV5XC4ehR7DGNP81vracavJCeJ9JzE0vrd9636oTW8WdUIbp6TX/OF3Rs0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530239; c=relaxed/simple;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgmuQpLh0rTx4q015KKycU4iXMQeQNz88DcDq4m1lVG3KdKzzLfR5q8WiFJT6JSaMNYTbQfbkGMb9sF14mVlbZqLV8DIJj2uxy/1BPUaUToQQsatC2dWUbrR8ATolGA80/DghSxGiYgqaA985U9nRZiw+13rqamXmYKiJW3umGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYMGQ5SI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1598C2BD00
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530239;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PYMGQ5SICzh6TMtYZllVYQ8mBoIBVyiWE6JyluRB+fj637AkoKx+rg9N8OVu6yBXd
	 2SCyWuajfyCbsIHOpZmp/sHCjqcSv56Bjr0Uvs7c3q6lTkY8f8mJuW+2K61WOB1ry7
	 piTykdQYp8a1vNDiN+OY/JQqhmlxRSBUa5lsOZET5UK2mWVb3o5n7+MeMtJx0GF0nI
	 TJhqHBpyOcoBv9yAgW/ts+hGEvg7CsBvZM8OEM8iA62u7O9NEgOr6RJJyWz0Je3QlW
	 5WMvLYHulsJKdEMtfcDcT4e4yQsOLwPa3zOvlYIEUR71RXH8PDFxjZp9Q9II8I89Yw
	 9o6hmQccGnPsQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso5362038e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XPB7hUlySEaRcqlwSxHHppaIrY0ERuFN5TdxOISkCw9aTgZ04dMpg/ra0JeB+Xt1ld5kZrpEEUKSa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6AaI6tYa7XZxpZXXSSzvikLzaQPZkngE/zg4nJN441JsL7wf
	e1zBTs2GFKHDdf9K4/4tTU3lJrSNE4jBihaoMb3CAR1qD1ycMgpYJBRsM1ybNXFN2CEJE5vqngx
	EeO7ZG0nAJZ5zorYg5Iyq51cFRxF6ucc=
X-Received: by 2002:a05:6512:1149:b0:5a8:757b:80ff with SMTP id
 2adb3069b0e04-5a8e30cf5abmr22518e87.12.1778530238394; Mon, 11 May 2026
 13:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:10:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
X-Gm-Features: AVHnY4LZZFweJ9DX23kB3j5AOHEOM6q-LmnCTtTxpeyXfj6_HN_B5gNoCZt9TLE
Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: mt8188: allow gpio hogs
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C1DB3515952
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36617-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Action: no action

On Mon, May 4, 2026 at 9:28=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:

> Add gpio hogs subnode rules to the MT8188 pinctrl binding.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

This patch 1/2 applied to the pinctrl tree.

Please funnel patch 2/2 through the SoC tree.

Yours,
Linus Walleij

