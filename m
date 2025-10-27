Return-Path: <linux-gpio+bounces-27745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D0C120EB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 00:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BC3C3AD3B3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E256A330B19;
	Mon, 27 Oct 2025 23:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMgQzw5k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA632E121
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 23:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607568; cv=none; b=W8y+9eDICu6bC0/rYrCKYBFcNuHurUROUKEG+DU80KeF5/esViqp7UdX3AEfj0tSQA/Ghqt6BryhsZOc75nJhUum9Hc+BxEu8NyB+ix+WRgn/jaNm9SUwNlWQqBUjnZDHGN9rAqZe6p4lHv/tWp/yxx3dr5nyWFAYlOPx0qbaz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607568; c=relaxed/simple;
	bh=LP08PxMOy3+q7wsXIRxd+k6qF4bhNukjRqN2R7SnbJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjcvGDllIdoxnVfAlgxLzRtYdgyBRE++jHuAswM2H9eMb5sc2XrzS2LjR45NR5R3Vg366QsVSBEaqBehb5KIQISn7wKfuHv8xAepRj4kzKFzTQDKGIaORezJmoipWHxxZJpoBlGOGFLgMLO2+aKzaeV2hPV5Ut4OmlWz3vGixWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMgQzw5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27220C116D0
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761607568;
	bh=LP08PxMOy3+q7wsXIRxd+k6qF4bhNukjRqN2R7SnbJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YMgQzw5ktHHkIoZDDp8fmeIIxPhW3KmOp1ndU12agoAwMolAYuds0tzDxoZ3lLwvi
	 90D8GNBcJ5MR9tZIXs60SeU1xedeWKwJkcxCo+fnrKG3wubGnSvNPIS+HfWrdLYQNg
	 +QSePw5bDWFRgOUuvQNlInvHah694lOFOQ+Je4wFctkGmNBKJjadfuhUTLtiAP5aRu
	 Et+cYmW/xRrC7IqJAPdd45iUVRI44kgi1zY/VHtGQLamY389aw1FUk6hzrog1UZ21F
	 x0I3LxUKX8UbrDXDNuKXePMos3odZblAdMODdYIFLTVqc/zNEk1eMhBxdxThXcNTRA
	 WeDELGSbTY49w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso9699072a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 16:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnrqFZ7xcbiLb/qOqjK1vPYX1/fwlWNhY9guWxsGpHdRSCWXOC9FunMBe50654/aPvW3aIyKJnvpVo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14XTF3Y5oggkyC9lHpYcP7JP6WGr5r5imnTYxxTdsKhlLvh8d
	kF/WnbI9TGU/oNtDIWGI6YlIlsNpE4GgVYcLGSmHV0ADW44GXukFGWFIyTRLWUDdqB9In6NLHPM
	vg+qdp67J/d/5kcHWFiTyvr58YqymbQ==
X-Google-Smtp-Source: AGHT+IEX1xGnmtwVGoDLaZVp4aFh7ruN9LkPKkhMyM+i6wHN4ucAhYDTaXvbn65T7tutgmjdp+KLABvK7KA+7GmnR/0=
X-Received: by 2002:a05:6402:5cd:b0:63b:ee26:5449 with SMTP id
 4fb4d7f45d1cf-63ed84b8529mr1554449a12.32.1761607566727; Mon, 27 Oct 2025
 16:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
In-Reply-To: <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Oct 2025 18:25:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
X-Gm-Features: AWmQ_bnoPPjAhNXAPXCoKnPtawt5o6d_64F1B37jF33JCalDTEepaJ4EpcJjEG4
Message-ID: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
>
> > Convert the Marvell CP110 System Controller binding to DT schema
> > format.
> >
> > There's not any specific compatible for the whole block which is a
> > separate problem, so just the child nodes are documented. Only the
> > pinctrl and clock child nodes need to be converted as the GPIO node
> > already has a schema.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Patch applied!

I already applied as it is clock and pinctrl.

Rob

