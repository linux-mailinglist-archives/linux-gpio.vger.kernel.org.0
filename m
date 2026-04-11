Return-Path: <linux-gpio+bounces-35029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM9mD/Ap2mmRywgAu9opvQ
	(envelope-from <linux-gpio+bounces-35029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 13:01:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD63DF6C1
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 13:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091A23019F3A
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C98325485;
	Sat, 11 Apr 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+an5xGC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CF18FC97
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775905261; cv=none; b=qOyw2fRkviJ5TXHtuyiY6tGg2Nk5HclqEKxfl5Apy4pwfLekIeUoukr8fEN5ycel3fj1jBz/thOb5ulj7trRgcep6hwdum5e0jUhZHt2kOKuc2+uOsXer8hgNWQeWSHKKDe35CKoFGJqXmFJM0NBMKWKc0AatBC8GSlwKeQmD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775905261; c=relaxed/simple;
	bh=MgymyLFGEC/VaLhYjpjCy1R9gxobl+Jkbqz8a+FLE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGVfuYi+xl8hPfYfa1o5MqW5SUl1UflBid57cxwmfYxlxdXA2ZiX7L6bNFo33N1x4FmdYOG7P40s2gd+rzMgGxN3A/Z5bWQ0K6k1zHPq6ziga0ILHUAWv1a4XLJ/m8FIO8+LRWR/qd8GusV2pHKWACwRzIK9yxqq5iU41qfe7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+an5xGC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76eea1672aso1016039a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775905259; x=1776510059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpF9jsXkbVom/enpAu0Rp5Lxh3ePskUNdWwqk/AnAbg=;
        b=c+an5xGCBxWvswN++RBxSpNoraugbRji3eAoWVU180SBNCleE06XU9Ydm6Zyh8DPDS
         pgP3XA7Oco7KcrPSLiQJuRv6D5jR+efafJoeicsYL5oMyZ4B71ixPT0zGmkn15A65yDx
         jKCnXxffX+HS6LGhvjp6s4RgfQVOC1H7BtCEL/LrWU8GoMoHaAREmjC4xT8VVHrMARAF
         xvFW6ag4bkV4R1kHsr2NAo6/g8d6i/Wefk47GPSpRQLW9gTig8GSWmEJTAAqBVWok8wZ
         9DtuRpY/ArE3A9AueTMK9izpk4H4o3KbFZZ2tPR+xj1hLy6XDO87b+08T5QdHFIe9Izo
         vh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775905259; x=1776510059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpF9jsXkbVom/enpAu0Rp5Lxh3ePskUNdWwqk/AnAbg=;
        b=XPVfoscPNO1X85lxpV6r5U/by+XzpP8W5BTubgHdsqnDG3wMA+yLuLQvdUsnqqZ3T+
         YLjIrClo8e2cZ8E6J3gz9K3IGypQkFSeYodoPopfD0t4Bh/lVjPXpntirRp6/z5z2HXV
         PMFl+NmpFRWpRy2wMKtx2/5KhkLqha97dq9hCeRj69NWrwxESL6rpMqUMeYHJL+Oik6E
         Bplwx8UvNSKqiF8ubBIzqpvDitCmY3o0xuuqAPyMupQX54EdasHF1LKuSkwSeVEtZq24
         4BXHV4RK8o7gBqv7t7s8U2gLvx8d5LKRb6LC9xR2HHhrP9ncUNaScz81LdK9rbs4UoAo
         tr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeBjoMJ/BvuKVMaWqddrd8SD85Y1FISqY+7gG0NIAZde6eAytSATbClN5huWqYRkVXuDDYtdSKN7sb@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAiauINNDQku02zp+zrYZTjKZ+1OJvlf7krnrwYvBvd1EZVz7
	69ngdhrKSYlxG0D2t1snhMVNTYx/8YeLCEdpe+as3Yku7VdMY90ZA7uu
X-Gm-Gg: AeBDieso/P7li6nNLnbISa/g4/HdX/zBNNzJ3OlYqArH0KK3NdvL2O5emwWf5CwqmDz
	YyPjw6CVkFomJs5LCQrUlaoCcBClEjOx3d5P9SL45ecWm8bUBJRjc8yoPIioabgeoZuoJtmcwIu
	gCYAfwJDA55iPydnjahLCXw2ueA6BbkU0HaLVkhGMFX2vRGCGHbHVvTxU/XfFs+XDOMRN0Y6jEL
	qtOwvPiM49ZFRNBla4zYLrnoWtLE3/AU4u8m1V6J3OVWZRizxqX2FRvvb7ZNCUSYFlTI0/N/pMd
	pPLVF1Q21GPzFVgZMkPQq+OOSjKd3QcEw8dw6waYNV0wPzU/MyNAgJnDRdBLNb9NpgYGMyOVUYh
	uRoeTFGUrHpQ+ofeKH8RreaXfK5i+JPDROCQwXsP8tBBcc/T/8ELzkE3WJRpL/yTp6mK2kTgK9v
	osU3uZTqrBB3YoNDWrshZl41vU
X-Received: by 2002:a05:6a20:7486:b0:398:b346:b13 with SMTP id adf61e73a8af0-39fe3d0dfafmr7968780637.16.1775905258574;
        Sat, 11 Apr 2026 04:00:58 -0700 (PDT)
Received: from fedora ([2401:4900:1c6a:cd16:7e87:6c5c:5d2b:6126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216fedfdsm5261128a12.4.2026.04.11.04.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:00:58 -0700 (PDT)
Date: Sat, 11 Apr 2026 16:30:51 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rric@kernel.org, linux-gpio@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: Re: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT
 binding
Message-ID: <adop40_183u5G6Jy@fedora>
References: <20260408093313.17025-1-i.shihao.999@gmail.com>
 <177572390344.62363.14529394859379173420.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177572390344.62363.14529394859379173420.b4-ty@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35029-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ishihao999@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82AD63DF6C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:38:45AM +0200, Bartosz Golaszewski wrote:
> I tweaked the commit message as suggested by Krzysztof and queued this.
> 
> [1/1] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
>       https://git.kernel.org/brgl/c/5bcd451286176202f4ba84b89fd98c7ea74f33a2
> 
> Best regards,
> -- 

Thanks you both for giving your time to review it. Thanks ,looking
forward to send more covnersions.

best regards,
Shihao

