Return-Path: <linux-gpio+bounces-30408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE439D0F2FB
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB91A301AB9A
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80843491D3;
	Sun, 11 Jan 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZFz5/xt1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A6342169
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142769; cv=none; b=XoM7IBaMQ2/t/bEgjST6qXaiusgSMAOxOdiNAWpuvRa3+IeflMoCYVMnAzrIpQTjXnpEHvcLhYop+um/l5LIWghc9/ECQI1x6uIKtmWpPq1ZwFvWa1GceJop7u2S3kGsllA+nkD+FHgBX5+cUZYmxAM8E92FqCaa5XN8IrggWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142769; c=relaxed/simple;
	bh=E3fIUBLPFnEXAfwoSTB7dOLky4Cj+/epBMllkCL2GpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJyCma02K/uJNIdjhloUaE25xeERabXieNdRzbLSkZHLU3pjKYL/VFm0050ATEd0X+xFiaVUhEIszsecVnZYdRNtSnpC9Az7LuAYyCg430VLFauFMG26gr2AETFqUT8lLL6jjrsBv/QMLNCOxQ1POHUb9O91B949vnMkcScsewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZFz5/xt1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so7237621a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142765; x=1768747565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSh5A9C/ikcooPDg3GNmd0+fIcS/l8zoJ1QKaA55bnM=;
        b=ZFz5/xt1R3RPg0IfhqILS6DeIcAi+Q7dknvvl7zujx9QVOvzKxPv6PbFWkA+xsWdwy
         q4RvbDBtR/HjlASIiVjVE8AqQ+cFMmSpSmHz/9zLrH9twpLhuoDOp2ifbX2+2rz35r8W
         EZggkt2Z25Ce3wkYydKW1eTb6s6zNkVGI4+qfKwk56y0v5hgCqKDZMbRcQU8iiV6WcXD
         bNlH8BXPaurlSjuMuJ8jWyp7GKnMkFz+dHJmqtCjFfpct6Tch/J1+bYJfTm+imAjQNT4
         bYlIO26xS8CbA20ia+8l9ila1DeJP0BiFxQQHuZUchuSBxxfuj1eBGaY4zansROWmVws
         ybLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142765; x=1768747565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSh5A9C/ikcooPDg3GNmd0+fIcS/l8zoJ1QKaA55bnM=;
        b=rnPxVyKU6K7zBwkJ7WmCD8L96ugGtyDo2mUDud12dhjxRX1R58BqKhLQGnUx0Ug7PT
         h6G7usUWLMKG/1nmubA0UWax0NWxzvqut2s66bnsRBlJwQkoyCqQocgrHbZjcQFUasRR
         0ockbjscaNErhUEMA1+a1Us+g5Cvah9DVx9YPS91sdMye2HInczRN40Bt+By8I+LAF7v
         k7ob9Xn7SSVLar6faxsAAObvgNE86a/e6tzIIL0WxCuDqHqvKzIMZwQYprYJlFU2ndvR
         H8LnFrExbE2iOLHsYUqz15/vnFrBSI7PfpympmgyhXM2QDeBFKf7Ut9iF4M+abfLCw8Y
         jGXw==
X-Forwarded-Encrypted: i=1; AJvYcCW3pexKX33cA2S/se5Y+/nbAPRyFJN/UIBz7pFmD51569kG7es5RMg7bpljiZYEHjjr7X82NX/jPCm4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy41ov5rAO0tY16/risWIJ/iFJlbtZl/iHEOCH5tM1ohdhiUnS
	Hqlhb0PxxC5Oqz22tWvZGCZ6v5iQqa6EzehQBCikO4LIStLGZLtdri6kZxyzGDt3zws=
X-Gm-Gg: AY/fxX4RRCzgFY1TZ8RFLz4KfFXQI5DzspekjBrtpLStwidlPtrGZLVIYJKOK/0fEQ5
	jwrOiPLo5lRl841aSlRji0gsK1yQFXG0s6aIBoICfXbE98h4euLw5omhQue96fGo3B4McmZDLfP
	o0medZf4kFET6dLUWQd73CgZ/pvNu/KAKyjdfZJPj0C5xC2GkmFOzRMlpdkMwM/ZzWmDMPZkB0y
	p4a8i9dqjinMz4dv3ivRjlzqmc3UclS+CBytNwGobYn6feAFzlnDRMwUBZGpCx1fA43015VO4Ix
	rjxaiiq8ZPJ8hXRbobTs0ynOTWihRgQapH0NT56SCVEkJWvFgNR3mXZhvCoIZpEzjFyp7XYMbRS
	UisBWErUlMPultmoIHixmW4hr0a63Px9+8kgbJGoawYeTYSjMGXMLFAxT4eZ9LAYlcpeU3uw0JJ
	3A6jQPz3+xUGJlJx4awt/8z3w=
X-Google-Smtp-Source: AGHT+IHdSgN1j5CfCwzzuZuuUE6k4oOsy7A6FyHYN7fpU3s7QMByt1Yrcz5j8phSUL1uwYAKt/FfvA==
X-Received: by 2002:a17:907:3c8a:b0:b87:1b2b:32fc with SMTP id a640c23a62f3a-b871b2b3d67mr52172166b.0.1768142765029;
        Sun, 11 Jan 2026 06:46:05 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870b0dba4esm216046666b.17.2026.01.11.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:04 -0800 (PST)
Message-ID: <dd70bce6-77c5-4d73-96ae-6a0bd8ab7b22@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-12-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-12-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document LAN969x compatibles for SGPIO.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

