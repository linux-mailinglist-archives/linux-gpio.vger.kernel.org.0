Return-Path: <linux-gpio+bounces-34024-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ASUJ8JAwWmeRwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34024-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:31:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F692F2F62
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 14:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD45A30E986E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B8839659A;
	Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5HtEG+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C739D6F8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272233; cv=none; b=X3XddfJgmKFk0/la4iyimdp1RQ90grcYSgsHsNsFBi5VXXppcsTt3HydMkJH/NW47PYJchA948+/8FToUkuNztCeUy+DuqfN9W8Nt1g3Dojaks/sAZ+gmdaDo1DuxPJXxCwEp/GWBc0aV7fe3yAjZX4cuuaFrlXLaoDIMBHPNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272233; c=relaxed/simple;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvMBmd0En4U4brFQmfRfqlqZK6PTcMATTkNlmPqP6osL5eXpuW4vjWbQxsGtdOpGUVIykqVhO0woIPP01GUsMSqAtJ8W2ZW9uIS9Yd8gj9pJdh4T7zykvo7CCAU0X85r1PCsvSzcfeCcl7EMd+mgmZSzZIZhgwXgse3E4jI0PpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5HtEG+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11876C2BCB8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272233;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e5HtEG+7Z0hUDOWD3lrZNo7a5ayfeIp4SuizcRE4uO+9EmsW6BKXHcDeifvaxe2rG
	 /ceh2tyMi5IQbD7GLa5h7LrgBy3Y8VacInQubtMZaeCLkxtliLIBn4nQGNwUOe/wBW
	 QbjfMaLR5sJXIU8YSZUO3SCti6TsRFNn4FiLOVdWtKVlTErmN0xUNv/9tkq88PPhTf
	 qssJrNQOt2HkVZyO8EvMkPR1qSjAZeNS8e6159kq2ha/5Iyvs43bh3AeN6D2/fXZU4
	 JHf64I8vwPYntE4oEO7/Bi25jM18wKuNtomZjGX6ciHWT02qSMeWrXH8R2oY8QYTFb
	 TJZQJ7uCmsVEQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79a60975dc5so1916807b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 06:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9jpNdtVhRfhIuh+BvFHBpS6x5oOWdswSD1qzEwQHwLWGq3n/R58L+aFZXo2w3XgtXfzZs+zuxTL8M@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3yI3xYnWbjmKe8GCjlohZgH0L6/WD7z7Wenjl0Y3LlfNIILU
	PBfajgriD3F2XS/3LMFlTWQBGCotkfV2eWroiqmJxNso7ZpRtClXaG0AHv9oZKLJXdgw5M8iuVM
	EohvK7kAu0Y2moGGGhY4XgMTbSaIJw08=
X-Received: by 2002:a05:690c:2605:b0:798:1219:c78d with SMTP id
 00721157ae682-79a90c0a53emr125159107b3.50.1774272232374; Mon, 23 Mar 2026
 06:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
In-Reply-To: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:23:41 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
X-Gm-Features: AQROBzCnimvZvEKxbgJqnARSDh8ZkIJDbBTIcd5gmgSkLxqAgXbW8hAX9GtTaeY
Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] fix gpiochip_lock_as_irq() failure when pinmux is unknown
To: michal.piekos@mmpsystems.pl
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-34024-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6F692F2F62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

this v6 patchset applied for fixes!

Yours,
Linus Walleij

