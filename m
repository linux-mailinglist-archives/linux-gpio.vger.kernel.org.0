Return-Path: <linux-gpio+bounces-27763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C440FC13EC9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 10:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49A9B4E43AF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 09:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249FB3016F8;
	Tue, 28 Oct 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Boa0le8U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A02D839A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645014; cv=none; b=h+nTwev6rnch3rg9+r2HZLQJW9J9DxG7jOXsf6cQwGlm/NbmqfK2vL6B4J4A3JMhLrLz/IbgfLtvaqUXA3Fos9IJ+CBh0c0nIt21YWIXlE8WvdKWMHpH8rKoDo1wq3+Q1KvW7AHN4CXv/BPiTfUa9Mb40+Pn/CMqv9EVZQMZ2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645014; c=relaxed/simple;
	bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEkB/A5A9T62yHJ5FnCmoJKXnhn3kk0dpIjlcVqTNmG404gD2DFUXrxPVvVoak+8RnkHAT63yMPChEgLsbZ00XxQyCmDX7dpp7RRi7eq08hU0GGmzEgfqNm3+NEQvXMqp1xmKeisNKj4Dju+aDm/NDA0RZVAj1u9vgGUDIv183s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Boa0le8U; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591c9934e0cso8312378e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761645011; x=1762249811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=;
        b=Boa0le8UkZNqBDBjPXJKdWx/2/cJoVf1XBCA4PQ9QTG+xaY/mj1iJVVf70MZw4szCb
         4Yx4H9wPsY8wkJK3zOZskLCZ5uR7GQh9htSu5/4ktQS24RDeCkhYXnI3pVuEhTAlupnc
         4sVVMKfSnikM1u+UGhpiA0cWVkZhNrZVgfSVD6sBiZ6+dhObQP0zdF6XS+NvEeCSVJRM
         E9UXaooUkutkH+Wgbr+5WKjCjhtK65aqIPFkoYjMNIMRWpX0hVkPCGSbuL6NJ6tpmAnI
         fljB54KPycwuJd+t/9vz8FdKGWdhIfsDaseguPpbzfRXAz4EMTxDs0iyN+610pdFWbMP
         sCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645011; x=1762249811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=;
        b=WvWTyu0F0qIWTiRLjUGE4oTvqXURXk3A2EYavYo5UDWFax40XfIoCnMZtbcNReJ39C
         5ARcVxIw7k2i6ZCGk4oq1Wk1EXPWRCHCwbg1HqL8gRfC4r02efDDTZvRwHogUSoQI6+w
         fF6yqm4RFS9vSkGhkxwqkYMfjat25Dj4Alk4QmONU1RLTqcsRoebnAcSQ8yZEiU3Woix
         LnykAZTJuGJUf6vQ2UvqURsF6lZoR7VZ+FdunDMUqNdhg8b4cbsiNS5SEAY27pD0EJBE
         S4osc506QSi3lTcR11K+My8qtk0/czeofmwl80R/zLaf2hnSHrIElQIru3Y75bovMxtu
         huxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtj6UeAWeQwjSU8e5vzBm8U6oxrUAohwKgJ6eUCvvl5xsO7yoU6KtjCwKQz09JRwrSQPOXM1StRBY0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjotMtJ1VXg6IvSDro7JF6XobbhwhQuMSd3iWHwTmvkAU9Z5Z/
	0CFV4WGkbfN+Rm6JNzQpb1au++HvDVF3aXum8wjZhYG8IgmsqzmR07UhXTycWTbQtx+7aRrnkO9
	9CSAV/FBsTJAi87k9w6TN+NihmnP/G8jdaNjhdL79Ug==
X-Gm-Gg: ASbGnculByZRFXTDX7/rFC/iyX9yVQndEuAM1k7CyUnVMzyCU9/Tb10aIofOPsGTMx0
	CH7zSZTBvD347aGFfhQy6l6GikgZDIRv5NttoDwb7rWxeEFH783lkK1wuxVFD1GQs/p1vVBSG6x
	ngYIDEFnx+a6D1W6N/PIjP2aA3HknF9WnnHikRBPYEnji6/AGJZeMSvNWx8j0oRDXMd+gvCY+L3
	fKtH37Y6qInoiRMTMWTkIcFq60yWoV32XRaL9manxx2JjTwY70/jd8pKynlgu9HCCm+VBA=
X-Google-Smtp-Source: AGHT+IHu10ZcVMp1t6exa1PSxkHFxphXG1r4t9C5bsmjcMdzTg/t9I8b6zTS7ONgJ3VxrVunoD4N4GDJPwxaS7n75Xw=
X-Received: by 2002:a05:6512:3f15:b0:592:f521:2334 with SMTP id
 2adb3069b0e04-5930e993ec9mr1158884e87.8.1761645011316; Tue, 28 Oct 2025
 02:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
 <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
In-Reply-To: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 10:49:59 +0100
X-Gm-Features: AWmQ_bk9HCEe5H9YQN8PNyspfsZbmH034UWjFM55zKwIU8N8qdRalyjCgv2QCTw
Message-ID: <CACRpkdY0+0UTkpXurB3E1Skce+Kcbti9-Z_2-d-f4yM-HuK_Dw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 12:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> On Mon, Oct 27, 2025 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> >
> > > Convert the Marvell CP110 System Controller binding to DT schema
> > > format.
> > >
> > > There's not any specific compatible for the whole block which is a
> > > separate problem, so just the child nodes are documented. Only the
> > > pinctrl and clock child nodes need to be converted as the GPIO node
> > > already has a schema.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Patch applied!
>
> I already applied as it is clock and pinctrl.

Yeah I saw, I dropped it now!

Yours,
Linus Walleij

