Return-Path: <linux-gpio+bounces-34661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCkMHHDR0GlbAwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 10:53:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E182B39A750
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 10:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3D43300FB72
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 08:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148AC3A5452;
	Sat,  4 Apr 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilHZxwiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE2334C27
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775292780; cv=none; b=Tr1yBDF7PjKgtsAcy+EOrPS2q4bTKKh/ZuakMuQm6MS+W9hJcefdOpHeYVBqaHyOvPHJWou5Xf75NY4wJYFZE5Z5lY3M0puIVTTPL0Sr7ZWG56FX6tOt17Be+Gt3/13C49d9OW01kLtMP8jxkFfEZfWiq7gNpFteBFHpkaoWncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775292780; c=relaxed/simple;
	bh=r1C3lzsUtmiKNwW2H1WNOIIKo2YXJF/eTqmy+2rXq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsgJ8XJckZUyViDAuAolfgGyBKi7rNBJcnEI+/ySh22gleGU+mg5/YVxVHUUls7Rb/ThM+T1kSob/2Sjo+amHMnNUcKWYOw9Pw8h6adQukIAzx9il/feU2OiCmpRqZ+45RNW4FDxn/8X7aYEhLKKolKS47xdEspzeB1GzRfVuAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilHZxwiS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso1615226a91.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775292777; x=1775897577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2aER+v8jW6q498vOyMse8nH8+3QEx9bRFbFB8BhKt0=;
        b=ilHZxwiSdG8X9hUGqDHJeS75iaqdyDoR/FhFXcsofIBQQUaHkczvlkMvhCSiWN7vLt
         OFn3P+F0jGS98EpPUx0CUSPjNZAlzLDAzsK89WyDIghGrxPzHQ3In7+eFhtHfRJYHuPx
         vVZhhrGtO4rMGoWxOnpvVVs3Xj+g+AS2zEbmQYhC7QbhUKb4NtrPATb49B8kPnJJfw8O
         c9wyFlo+EJWTkF1F8d7LnSAv5dcyftRHKrOK3XHTw+C+zQSUwQUCPoysZrD7Scm1zAOH
         sTLqSoF/iOUM4xHFqR28tUgJ68qUAtomDJVuvsx0y3JOYi0B1H0LgPEOSRMtBKuGovpA
         r6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775292777; x=1775897577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2aER+v8jW6q498vOyMse8nH8+3QEx9bRFbFB8BhKt0=;
        b=WxGc046X8XqD5ivfiLMSMNiQUA/t1Y6O+yoaAnT7KZtScQc35RfcokWVh8P4CiJWfn
         zv4bcbVPGWMpsonckYfll0dnDlV1aySqfQJE1ooyHXi3IcM6+PQEdeHcQ1ym/mWKkAXa
         AnSDvmzTY6+AC/GoG2Z76KM7iduxbpb8ZfhPDi0Rj0L9d+23B0okWqXD7YPq/VCqpwmi
         Xryk5GkiNGWm5pIVs5L2ySOnzJ43a5LVnTkelkJLeGYdyvYv2t8JeXoLd1XKB0mJfOTm
         hRDvbodgSKRFW9EJBkFwg90a6bUachoM4hgU7ahSBnj5zwRcIe/HSXAZrp/9NzRfpjp5
         BbAg==
X-Forwarded-Encrypted: i=1; AJvYcCUN46L7S7ZCaRl6DvYOPPIlMiyQQrZo5eKRqo4+cGmVWEOPxFSi3KKPKAVs8laLzTk1KSCc+/r8s3mM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdzx/Hrkn4nZrz3+uCxmuB5Sql7GKrdA+NyQRxG83UUMM/yUvb
	47JehsZbLNlXeDfV6gCshn6QV9BbjsJcNMFeuO2ucjfL/m81Z8MlMBUr
X-Gm-Gg: AeBDieuJxBKYYA/xkZnR86gPz1Ev+iejlIHtPO+fSrON4y3gNc/YaoqhP/N0qikUkoh
	rgVNwW06zy0O/YwWFJ0ELPKyzQp6C7GlNMyIsJjmzaoFqw746v0bmXu+SlaoWjTIQg7NvmN5fmr
	rj3gPddptFv+VOK579O1J1utovdUuhE1TTkMJOiWSzeYqo9lxHHhcCRhw14RnZL8t7MfqwoxmjY
	PCNmFmO71ceqHixPb4yMCVEjZ95zev/54SqA+i2hOuj1jeBNapi29dsvPSUKWxMsXrAfs72yU8A
	Dif2Jku8AqTJAcfpFYBT24P9kvZd+5GtAbxRAkSNa5WEVpX6rTAhVtLR3O6lfXTGasoMwerI4Sh
	08TQ2rQJ6y3xqqAUV29+tVuLHDMtIi2RefIq6kKyCHdyh4F41fZOlYRKopChjiGszisIl2gyRHx
	GFjX9DtyCs+1Ti6jsT/wSv
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr4814877a91.25.1775292777269;
        Sat, 04 Apr 2026 01:52:57 -0700 (PDT)
Received: from fedora ([122.173.28.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367bfb1sm7954011a91.10.2026.04.04.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:52:56 -0700 (PDT)
Date: Sat, 4 Apr 2026 14:22:17 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rric@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: Re: [PATCH v2] dt-bindings: gpio: cavium,thunder-8890: Convert to DT
 schema
Message-ID: <adDRQbpl1lBinbij@fedora>
References: <20260330080108.24294-1-i.shihao.999@gmail.com>
 <20260331-invisible-certain-albatross-844cff@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-invisible-certain-albatross-844cff@quoll>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34661-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ishihao999@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E182B39A750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 09:30:56AM +0200, Krzysztof Kozlowski wrote:
>
> This binding is odd and not used, so you should follow guidelines I gave
> more than a year ago and updated recently and NOT convert it.
> 
> Or rather answer - why this cannot be removed instead? What is the
> benefit of this binding? Is any other project using it?
> 
> 
> Best regards,
> Krzysztof
> 

Indeed this binding has no active user and i think it is good to be removed
entirely because no driver no dts sources are using it , it seems abandoned.
Please let me know if I need to resend it if it needs to be removed.Thanks
for your time.

Best regards,
 Seihae no driver no dts sources are using it , it seens abandoned.
 Please let me know if i need to resend it if it neeeds to be removed.Thanks
 for your time.



