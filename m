Return-Path: <linux-gpio+bounces-31035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOpQHEredGkV+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-31035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 15:59:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5137DFE4
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 15:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79960300D178
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 14:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA7B319852;
	Sat, 24 Jan 2026 14:58:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from torres.zugschlus.de (torres.zugschlus.de [81.169.166.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8481D8E10;
	Sat, 24 Jan 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.169.166.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769266713; cv=none; b=sQDlOoS/1tAW91vjO9AtziATBK1dnEjkLqyzUi8fq4tQ0mtt+1S6kDRj2iWCG4QPSMVPTt6AABKrYXjpa9WbhXWxf9P3t8dnVhjc1/iC7PitcQH7pzclaLwcaH6BwpXEFOJL32nRj8YDbttoLlX8y96pDwV2DmkjYg3gLzBg1Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769266713; c=relaxed/simple;
	bh=iAOxrdJIqP+eJnaRRQV2HSrllgrFBoj5zklub4xneuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unKEkcfoWx2J/nZmkRn2axbAjdEoQFsW1YiUtSkH/RgU/dVUCRrfBR8IqGKcu/8bCIAIshd0vuCUJkE9SF+Uu0KnDm4HYwUWU7YuCU6buoupnW2Fnf0EwwAjB5Z2ljiwJT3XJ52ylTwlofSAb4KXRdRWJk6/I0qkwoT/Z/yFw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=pass smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=81.169.166.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.98.2)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1vjf5h-000000077dx-2x8A;
	Sat, 24 Jan 2026 15:58:21 +0100
Date: Sat, 24 Jan 2026 15:58:21 +0100
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: regression 6.18.>4 gpio-keys-polled: failed to get gpio state:
 -52
Message-ID: <aXTeDb68H7ds93o6@torres.zugschlus.de>
References: <aXNMSu0RnhTI4BZ1@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <aXNMSu0RnhTI4BZ1@torres.zugschlus.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,torres.zugschlus.de:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[zugschlus.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mh@zugschlus.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31035-lists,linux-gpio=lfdr.de,linux-kernel];
	MID_RHS_MATCH_FROMTLD(0.00)[]
X-Rspamd-Queue-Id: DE5137DFE4
X-Rspamd-Action: no action

Hi,

the issue is still present in 6.18.7, and I only see that on my APU2 
machine with an AMD GX-412TC SOC.

Greetings
Marc


On Fri, Jan 23, 2026 at 11:24:10AM +0100, Marc Haber wrote:
>@Bartosz, I have added you because you did some work on the gpio stuff 
>in 6.18.
>
>I run one APU box with latest gerne, and since I booted into 6.18.4 on 
>January 9, I get multiple entries per second like
>Jan 23 11:19:20 prom kernel: gpio-keys-polled gpio-keys-polled: failed to get gpio state: -52
>
>This also applies to 6.18.6. 6.18.3 was still fine.
>
>Do you have any idea what might be causing this and how to fix?

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421

