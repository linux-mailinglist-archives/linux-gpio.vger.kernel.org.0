Return-Path: <linux-gpio+bounces-31033-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qg27NOa8dGk29QAAu9opvQ
	(envelope-from <linux-gpio+bounces-31033-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 13:36:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E127E7D9B5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 13:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E725B3002F70
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 12:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84342F069D;
	Sat, 24 Jan 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKXZuKU6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89C24290D
	for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258207; cv=none; b=dRMwRpm6L1Vwsqh+i+z1CUPXvIeJSHzRiVtKo1/c8zYYskDVmtzr8fQL+TlSxtXNTifuKnw6IAIXNeSX6ZtgsRqeVdr7pDsge6ilOvJImEpNsNqQNB9HMUNlEvz9Jzv+74pQV8dGbmRgx8E+Xy9UdVnA3tWLdylU9hi7l2+eWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258207; c=relaxed/simple;
	bh=2lpZPiehnZVWy67SwNKoHY2awngWTM8se8vqxPxB49s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtOhDpldJfKepVrIk4hIo+4HN/L3KCKaySx4Igm6BatpD2EWz3gtPWz9NdpRIx54Oiy/uiZxkX09X4p3wWSUFYeVXMOMhm4b14bHTcxk9VLaY0JJO3EwGf0gNus0ZABhYClWz3JCZh1Lg9+5iOAG1AHVnOX2oL/b760pjIxvOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKXZuKU6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1865157f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769258204; x=1769863004; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWxFjlQ15iLHcZ2sWOA5/KipFAdTrRSE3rE8bBRoPNA=;
        b=ZKXZuKU6H3gpgJsBv4nBKoSRZurn8Uq84zCD5msjjPeLSfiZHak/zkvW5uVpmUeVvu
         IQ7b6BTrwj2w9L8U1cdLDndX2TzL/nBRBVaPPsIn8I0I/BC+UX1pSiEKnHgOzQiv3Kqr
         2Dtd7OglaljVFT4EHPwI70g2PDFnu58bcaWX3Kf6JXerqh4rxnVtsCzr7ljxQH6OVjNE
         So2h+8zVCiz7V+tb9gMd9NOUm0WTkWZDP1zmhJnqmKNTG7AzfDCANQk7mxiXsXVVb87s
         1WGs3mc42WxRCY8yXugGy/O5l7bEn0cywRpujac9wUrOamSS8ii1q7RU9D8RhPdaqDFw
         xGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769258204; x=1769863004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWxFjlQ15iLHcZ2sWOA5/KipFAdTrRSE3rE8bBRoPNA=;
        b=F/fbAmPj2rCdG+Yi2MCv6RbNPpQ4RfzbHoU/kwwn8i/VCKOALpRT8kY1yQmP5v02TV
         Rj86ycHtptgrfb6dsNNSXrpeGMwSWdbbsh2oDFAd5ducf47/SE4qgVogEzjTounuDSnc
         MaJ5c4epsUsdaOIUf5AqbgHQ39chPpIwkvgCLG+VYPyUv+SnzTKJs9XFPz5nE8b6P1B8
         m57fclsLx+qIancs+fVhD8UvsDQkdmWk2c8EffAbF+iAgP7ftmTuo426rJbzO0mIMOpB
         BpaBpriarhmMgtuCSRysnEIeZu2jfN8zWFwwrS7/5h4oe13JgUTXQDANk9kzuXi2uhzL
         9wdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV15QeCd3SBwvcjZWwZJXpdc16xdN2wGv1dL0pvl38HQAgzrBChZ3FripylQsJ2nrGoEivzDjDebL5C@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCtycFBM2wNBjz+Fqqj75TAYT/FSNL+Bwf3ZB+E+uXFQeHgqv
	xuEKKH1EeINO5S9uLG6QQrTmJP9mESanMLVH+KlaeQORfHb8BwHZxHmn
X-Gm-Gg: AZuq6aIt2psK2wwKIB/02BgiwaWVTip44hG/ElrKz2GeXW+7tzzEZgTvMRqLH57LfKr
	fCQCSwR0UobtZItqOpZf7IiQ00W0y9Z/MQLg1ZreNPOS0QDHKdE21hnhx20Wx6s8oIvgMXrCEPW
	9k/SruweF6v10KnQT2y0MacREAM7WP72yvz80ZkfZEd2rr7rkOuBUWfheqSBT2cFC0WKANTikNJ
	NF04kd51Ihxaa3NcAf0YrNcMQIvn70Exr2mCZ+b8Y4eSTXCR/OhTP31iUL5Yn60nxjwY47Jxmbv
	CutDb1wwYZOx0EB3p159Mq0fp9p1bzGdOQ1uWe0kAvAppRSvpScE0kmH6po34YU9yGViAigPStU
	akmD8DULX9vyRaJxImcQIyWKeIdZF+YV2LTo5YAHYV2Ad846TBQgbeesPMDac5v9Bxv4Gk95MBL
	AVsqPGpFWK5R/iN6AGgc9HngQ2wN1i0Oh1T/hxQddn0062SDNoeH1Lq0BeCOqgoFj4
X-Received: by 2002:a05:6000:1847:b0:435:9756:d4c4 with SMTP id ffacd0b85a97d-435b15d6927mr9998528f8f.17.1769258204232;
        Sat, 24 Jan 2026 04:36:44 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c9cesm14772613f8f.41.2026.01.24.04.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 04:36:42 -0800 (PST)
Date: Sat, 24 Jan 2026 12:36:42 +0000
From: Stafford Horne <shorne@gmail.com>
To: Gary Lau <zgliu@foxmail.com>
Cc: linusw <linusw@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-openrisc <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>, robh <robh@kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	geert+renesas <geert+renesas@glider.be>,
	"krzysztof.kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	brgl <brgl@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Message-ID: <aXS82qiNNvPVMqdV@antec>
References: <tencent_F07E7380CFFB3A6A7480FDA42A636B7D290A@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_F07E7380CFFB3A6A7480FDA42A636B7D290A@qq.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31033-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shorne@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E127E7D9B5
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:18:04PM +0800, Gary Lau wrote:
> Hi Stafford,
> 
> I should clarify my setup: I'm using hardware address translation to make the
> OpenCores 8-bit GPIO appear as 32-bit to the CPU. Specifically:
> 
> 1. Address translation: The CPU's 32-bit addresses are right-shifted by 2 bits
>    (adr_i[2] in Verilog), so each 32-bit CPU access maps to the correct 8-bit
>    OpenCores register.
> 
> 2. Data width adaptation: Only dat_i[7:0] and dat_o[7:0] are connected, so
>    32-bit writes are truncated to 8-bit, and reads are zero-extended.
> 
> This hardware wrapper makes brcm,bcm6345-gpio driver "work" with my OpenCores
> GPIO, but it's really a hardware-level compatibility layer, not true software
> compatibility.
> 
> So you're absolutely right that the native opencores,gpio isn't compatible
> with brcm,bcm6345-gpio. My setup works because of custom hardware translation,
> not because the IP cores are compatible.

Thanks Gary for testing.

-Stafford

