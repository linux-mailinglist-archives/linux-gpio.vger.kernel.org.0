Return-Path: <linux-gpio+bounces-25599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63607B43EC6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E780E1C87E3B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1738530F926;
	Thu,  4 Sep 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R00ZNFjz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C6308F0F;
	Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995987; cv=none; b=h41EHJfa4vsq13x2H/EOj6RDKqESwD5N0tVdvBDDFOpCxy4opgUMmVK5J5DAnDTUmnrzCUkjk3sj6XC4O53Hdd6bjSYl/SxBaaQn5rdEFB/MNR++aCpRLJOlaofgR67slbbVQr6DltXn2uI9VUDAXjTGdRmZ+IztpuvY77x2VvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995987; c=relaxed/simple;
	bh=MZTNLy8WumQBrAUxZruJ7A1RSPvhV1IcSRMMDbYEd5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EL+yivlZWTsXuywnDOlHgIO2Plds7SIEvKqu05OB+myjEmVlL92Af0MFplNAKSuejPog09IVikUlPCNiyhy9ah3r+JVlQUXnpmS3FATGRn8btNNmKCclYnzveyM4jkUUnNpGbmMDujjIWMXS29YrDKBRnXyjQ/bw3xT4qcW5Vi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R00ZNFjz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405D4C4CEF0;
	Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995987;
	bh=MZTNLy8WumQBrAUxZruJ7A1RSPvhV1IcSRMMDbYEd5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R00ZNFjzGvMIV1z1JYLS3srxQQe2x1VuVBDB1GG9YR4OKz57tshnqOOqZbLxmuw7L
	 xCLf65RuifIExOjc5NRKkx7vyOAC82sUKsXlUMqQ1+Pw380aoUXWHh0Md1bMsrnmyZ
	 OtOc5At3+5t/P4f+yDft7PUret0sxRxvwWfSDavwSIecBLdmwg3quI5ZkR3nfKlcKJ
	 ppjG234+0H4XtAWuwsZ8HUj5VaqZTNcLcAWqz5AFdW8D9JuiU2n0B5jbxvtzds1s6D
	 FDaRoI+5BBmqdJ3QNF+/AVMi5Cvld1RLZMJbu5vsgORimigAPacWt4u6Gm216QFA4m
	 0YuH7TxGBx3Pg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b04163fe08dso186001766b.3;
        Thu, 04 Sep 2025 07:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOkuy/iIq7PMQjCDTGmPIOvDcRfojZ8HaXhR6GvCcMHv6PRLp3z6zBeOU9pPfWzGeLTkpxveB0hpS+9g==@vger.kernel.org, AJvYcCWtwC5kryVmBzQWwC7DDsfRpC7N48iZ2PqNHIfav7/qaObSJ+c4aGWJYE+AclUl4t3Wwggmm0ZbBToNmJhe@vger.kernel.org, AJvYcCXg5YbiqyhTddxs4HD7GHIN8rZrMweSOiKfgI1y6fqFRt86ke4eUWhTRopAeGtoYro8iTNOiREyjiiL@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhya+eHmP5piMaV2CzrTf9ehglNZ0szyKgTyzmSXz/nWY6JbD
	j58ZmhWFPd/87MeDme6Sbm434BfdWuAgdxUXL42VuDDPOIRtxUgLQKqs+YkZxMdv/biQzwFs7B8
	DaVFyWHjhNzTHBeHqLHQX1uODMZIr8w==
X-Google-Smtp-Source: AGHT+IGC6do4FFjOEe96iRxCl7OvO0Z8eMjKL8C03py3+afXpF8z+wNZNrq9fN5BUDwZ+RhTw6v/xHjprm+YASxMvpE=
X-Received: by 2002:a17:907:97d6:b0:b04:6858:13ce with SMTP id
 a640c23a62f3a-b0468583507mr693956966b.38.1756995985863; Thu, 04 Sep 2025
 07:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com> <20250904103401.88287-5-billy_tsai@aspeedtech.com>
In-Reply-To: <20250904103401.88287-5-billy_tsai@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 09:26:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
X-Gm-Features: Ac12FXxgofUZYm-8aN3VW1dq-DHJjDy12C9x9yYGuLCJNCxaxLowzVV8WhBnhEg
Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add AST27xx pinctrl configuration nodes
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linus.walleij@linaro.org, brgl@bgdev.pl, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 5:34=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Add pinctrl0 and pinctrl1 nodes for AST27xx SoC0 and SoC1 to configure
> the pinmux settings for each ball.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++++++++++
>  1 file changed, 1359 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi

This file isn't used anywhere and is therefore untestable. If there is
a dependency to apply, then please specify that using b4. But then
this would also need to be included somewhere.

Rob

