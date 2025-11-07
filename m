Return-Path: <linux-gpio+bounces-28253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A9C4125B
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E0A188C413
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421D23358DF;
	Fri,  7 Nov 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzlRLGiF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC3F32C333
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762537761; cv=none; b=JFJhXb3xgpCtM/rp3aIqqebQ1C+oR6uHbaUGfM3h68yI1mAAdj2lI3R8rNY2EGed9zHaZ8UYCxCFdV1h5TSNUmSCvafEFG6OcFMlK1RnPrdus7cH4aGbv2yLRPaOBp3Ptv7btGCP2MCtJFu85/lWJT5UiwfYYD1JW4ANynoovBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762537761; c=relaxed/simple;
	bh=OCNdxRW1IYaC1j6PkP1OCghDlVuNLB2cyrdqHo1Qdqs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjcsmnWDpPrkhz84HW+PZNSDF1ipx5vdzxQZEDqSwTk1u4mXfII7GrMCjTpyDH/+qR7Iw5BCiOwavKr8h9d0nGXjhHEyjLc4g0O8Vc1lqV1J+RyS4D5meG9utWqQxwORRKurKqDWSr8jjq7O2TLjLZ6lzdaXqFkymm3kZW9SBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzlRLGiF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c48e05aeso635570f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 09:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762537758; x=1763142558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cmq9pT7Misz9s4VB/B7TdNfaf15j6zAigKUGG6pS/SY=;
        b=JzlRLGiFKf1ol41cI2IrFXYPlBuEi+3y7Uj0j7QO3ail9SSUcMHUDYtWTJRT4Y99JH
         l5FoiZjWFZMlFu+yfACJUgoUAw0ePvsMnWeeAS1ifOCO1N/CRxVUOi+Sl1YTEwwT8iuu
         mhfv1J+L+vNwgHM1Pq8kMYP1gkk22OtsZgPpSmD0gJbl0dYYdPdLSJ0mnxy3uE5u540i
         nBX4Al3GPQyCiR90XKNLDodKH0OyhllxgZPua508W201bYjzLJKluWV0QZ9PFbmY3hDc
         5yhslRN7BfGd6ZJ6CO9xjp1jCJA5qPe4TQJFAVCdnBxwf1uuHn3sQRPfhdz17ZeH71V3
         gD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762537758; x=1763142558;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmq9pT7Misz9s4VB/B7TdNfaf15j6zAigKUGG6pS/SY=;
        b=aDbe8Fvz7v3E7fr8OKJiPJrbjltoLcO72cuREnfpCSDOZekoyjZJJz+ARSsv1NAFP2
         noxA8nZ+pb/8QvR3AZKe2PglEQROK4dn6i3MTymKEmrqwOn1DPNI9Tca6HaFWEzK5z+h
         3WwCjKiL6zEFpGfyb7RPSOWR8cML542k5Zm6jfXIMTYIim2FoQc9lnq+oP9SpmyeGmPC
         2glamPTiLc7sfoMs6KU7VhiPochtx3Xhs/j1lTpRKjgsaehK827LEILpmCAtxhpbXkzA
         GWuy11h+Z8WnZgZJXIfUX7YvcfydgYUvBUzvD/XrZjAd0F2DioVHGfSMTprTa3Db2/kO
         2KgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGbyjwzGyLZdfYGx8WSUZdEBxZnmSv7fth/qynQ1vBmvJIaDiyiizrxqDu5x/2WcqnPJCoSGGxagR9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJgW/WK+4i5Q0lNpU7Vx4abQ5R9AlG8sDtw0FwKzJueCr5Tt/
	s4l57tabDSp/VJQ1tMzDwa2xG4obtzDTM3wHFzRCYMtLTgKOK7PfYMDR
X-Gm-Gg: ASbGncur/CUHxeSzuPvHvslKkmT+nu4NPXvH4EuQ6+yL70XBMtzVSXoQIBUhlYzeCbz
	QUwsN4cx1nwhiXTP99RFUN0xzF6+5d5QrQsIwhykrn46bjYIx/C3wMDJB+yAal07T0yGQ6bn7R8
	/7GqKEG218P64Y3czNH9VMGWLCyA74PRIVKdIjVWZquNCIhum7dzTTi98IiU3LZIwNU2aPWCUwE
	U/e1WZph3AVOyETuLpUh/GgmZNuzt4T3TRTCLo9szwwaxgVdB61nC7q547UeXBF3NFDrmUgh0iy
	wchwKlVYH/fNx6uTlY7iWGCymuFZZyVuKa57OqRWoVbDKsXummaChsSnJoPjvynzXUHNfNTWb3x
	8EgE0tEqKZFNlgiywfDybxd9KTvAUKKK331VL4EiNZIolnPKGVosIJfQKcz71DhT/0vKmxdD8sb
	A9hh0aqXCrLcP2VJ9cUE+70yuiTc4R
X-Google-Smtp-Source: AGHT+IGejCZdNQWYzzYKXyulx7D4hGO+/hfj3nCbt4DKHyJm8dB3hqEzCyD5AYyGNe1UabBQmO/UtQ==
X-Received: by 2002:a05:6000:250c:b0:429:8bb2:d0ce with SMTP id ffacd0b85a97d-42b26fb47d7mr2445454f8f.18.1762537757448;
        Fri, 07 Nov 2025 09:49:17 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e07asm6575381f8f.17.2025.11.07.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:49:17 -0800 (PST)
Message-ID: <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
X-Google-Original-Message-ID: <aQ4xGRCSkjsVWQRt@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 18:49:13 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-washstand-motivator-c5e5e5d30dae@spud>

On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > minor difference on some function group (PCM and LED gpio).
> > 
> > To not bloat the EN7581 schema with massive if condition, use a
> > dedicated YAML schema for Airoha AN7583.
> 
> You went to more effort than I would have here with that conditional!
>

Well it was suggested by Rob and it's honestly a copy paste of en7581
with the relevant thing changed.

> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> 
> What's up with this regex? Why does it allow either - or $?

It's to permit either mux-* or unique node name with mux. Pattern is
also used by mt7622 or other schema. Other use mux- to require a name
after the mux.

Example

./xlnx,zynqmp-pinctrl.yaml:37:      '^mux':
./xlnx,pinctrl-zynq.yaml:45:      '^mux':
./xlnx,versal-pinctrl.yaml:34:      '^mux':
./microchip,pic64gx-pinctrl-gpio2.yaml:27:  '^mux-':
./microchip,mpfs-pinctrl-iomux0.yaml:33:  '^mux-':
./airoha,en7581-pinctrl.yaml:51:      '^mux(-|$)':
./mediatek,mt7622-pinctrl.yaml:72:      '^mux(-|$)':
./nuvoton,wpcm450-pinctrl.yaml:64:  "^mux-":

-- 
	Ansuel

