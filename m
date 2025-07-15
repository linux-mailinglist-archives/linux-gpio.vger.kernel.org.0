Return-Path: <linux-gpio+bounces-23278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEFB0533D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 09:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253D7188513A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 07:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6508C274FC6;
	Tue, 15 Jul 2025 07:29:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D082652B4;
	Tue, 15 Jul 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564591; cv=none; b=a9aI3h1iDXmUxQZBbrPcivT64wOR12a020q7cBA54HB+4oAi1Mt+0CUE+a6TdLrPlSydVeXLsTyMgJI6ALsMFeAqy5Z20JQmWNEji84v88hQtyUZjUE/6GAMX596dvHiV0Zd+jnETngogtcO9S2+1iJMqNLyOi7h528Hb2i6+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564591; c=relaxed/simple;
	bh=uIrUoInFO0skZIrnEf+5yZv70ZCTSME6zyrqXU4AwOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cikRUeEFR51SvNr80Q+how7gM1yDPDTeJrMcjz0PsDONSNW8nK/kqdRM1w4iyarnL5du4Njtp4Dv9t8bRX/wT6XAJ3gqSmXxYmDIgzqT8hZS0/CTPHplHvGjuXvVyEhNo/G8S2kla/8aLxwOy+YpDQ+KAL6EoZ/wLBjpI6USECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 2ADD82C06670;
	Tue, 15 Jul 2025 09:29:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 15374438E2C; Tue, 15 Jul 2025 09:29:38 +0200 (CEST)
Date: Tue, 15 Jul 2025 09:29:38 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert maxim,max3191x to DT schema
Message-ID: <aHYDYj0HSAUT9Hc-@wunner.de>
References: <20250714202843.3011698-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714202843.3011698-1-robh@kernel.org>

On Mon, Jul 14, 2025 at 03:28:41PM -0500, Rob Herring (Arm) wrote:
> Convert the Maxim MAX3191x and similar GPIO binding to DT schema format.
> It's a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

