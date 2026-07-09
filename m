Return-Path: <linux-gpio+bounces-39733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixH9AOGMT2r2jQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 13:58:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4C730BC7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 13:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=ZDjPdkfS;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39733-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39733-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D00C300AB15
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A525F41F7C2;
	Thu,  9 Jul 2026 11:58:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A03BCD15;
	Thu,  9 Jul 2026 11:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598300; cv=none; b=WDr3h9KAMXuF5XJnjMveU9S6OD34Y5Do6PUjCHX3l7Mfw0QWUAZ+YQ9rxO09VcQM6KL96uqFwTxc0Wj8xlVcAmTa3GqLqcrxLqKOa+U0EF7oB6JfdPqWheZRcuZwT5K2BFGnpKTKwgAliAHXkSVbr0QrvcsW6zbD/BixvQ2F9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598300; c=relaxed/simple;
	bh=0l8hKYZsEJCMBNL+X7+mtDqQz8nsijJQ7qlJBYs68jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNfGCzIMlwA99/+4Bf0aUZYGzp3kWFd7lUeUMaeq4I5fpzollRIdqXcMgSgOH+dUZlDtfEJRZWHYU5hp0SI4e1G7xVuleJADUhLIeWuuUZbmp4Vk21d9wZrX2RVl8ReUwtjmpUMxmM3B4aRhX2N8h2y/pnA2TTYNjnedhislu2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZDjPdkfS; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783598295;
	bh=0l8hKYZsEJCMBNL+X7+mtDqQz8nsijJQ7qlJBYs68jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZDjPdkfSK69yVmIaEAk1+TJxeZr8mt+7OsHyjIIl6rYXJv89ODdh/Z/fyjs99nt48
	 EgJ2tCrQzWssQva7MvmvBfhnY22o3ASoF/lkc8XCza3wyxbJDCE2KEAttCXIeNr7AH
	 xQlVvlT4eFsXxZdtbQ3e+FucWTc0XjMTi5O+grXYz9Q8ea4Q4MrCvQtPf8U6VHI9Qh
	 QDyEzfGWZNgIUR7IqF/sCl8gxbbplLYyfNhdajB3mSrrwxhuv/vUuDtVlN9CWonlyk
	 NkG5x1h/e/R0ZFtXZffqJWlyZRnAjfYLQ5UGkXdwJ5JmjewOR+U9LvGbjJq84oGfOJ
	 GOi8azvVyfV1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADF0D17E019E;
	Thu, 09 Jul 2026 13:58:14 +0200 (CEST)
Message-ID: <e8ba5a28-e06f-4351-ae71-ac0eca350916@collabora.com>
Date: Thu, 9 Jul 2026 13:58:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
 <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
 <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39733-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:conor@kernel.org,m:linux-mediatek@lists.infradead.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6D4C730BC7

On 6/26/26 11:12, Luca Leonardo Scorcia wrote:
>> Usually when making ABI changes because something was inaccurate (but
>> not wrong to the point that it didn't work at all) it's possible to
>> support both new and old ABIs at the same time because of new properties
>> etc. This is a difficult one because it's using the same properties in
>> different ways. A new compatible would definitely be required for a
>> genuine fresh start while retaining kernel support for the old mechanism
>> in this case.
> 
> All things considered, the cleanest solution seems to be adding a new
> compatible, mark the old one as deprecated and also try to fix the old
> driver code. I'll try to do that before submitting again.
> Thank you for your help!

You can skip the "fix the old driver code" part. The only users here are
demo boards that aren't even used that much and besides, they're even hard
to find.

Cheers,
Angelo

