Return-Path: <linux-gpio+bounces-32080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCslHKKynGmxJwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:03:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1617CAE3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 21:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99DA2301F6A1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2536D4F2;
	Mon, 23 Feb 2026 20:03:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17230361641
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877020; cv=none; b=DzTA/jt5WyqkzUaBBuNzbMxthpqJdqr5AbVO1UJBsqvVK2tqyamtNbyn0o/QhChcabAHvIo32Ptk9kZ128P6KzowUafnbEDOiXq2U6mCEtSabHe+HJfAyFsSUI7wgv46yN6iWptfbhktUsg70MNtgJ5JgzE5EIMUrMaZqNYhu7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877020; c=relaxed/simple;
	bh=9tUfQSfq5mhX10Vym2VxXL5rNzfiDPP+jXksmUVL7jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z9fYujjsYl//2JATSPcC5qD2VetqtxWXP0UK1DYw1+ustBCBzNY3PUpUS/HPgh+1tA9tqbVtVzEmNnEaRmrUgwtZZTfH9twd9nq6oA22F2nFBDhnycf6p7fLji8dPZ7SCnKP+N4vmuSokgFnPokQ5wGoR24oSoZc0NrfD1eW5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.162.218) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Feb
 2026 23:03:33 +0300
Message-ID: <ecf6e7c5-31a7-4e43-8ec9-c6afb0122e03@auroraos.dev>
Date: Mon, 23 Feb 2026 23:03:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: rockchip: use *enum* properly in
 rockchip_pinconf_pull_valid()
To: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-gpio@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>
References: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20260223194424.19251-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.959];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtesting.org:url];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32080-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 1AC1617CAE3
X-Rspamd-Action: no action

On 2/23/26 10:44 PM, Sergey Shtylyov wrote:

> In rockchip_pinconf_pull_valid(), the pull parameter has *enum* type that
> is not isomorphic with boolean type but it's used as a boolean expression
> in the ?: operator.  Compare pull with PIN_CONFIG_BIAS_BUS_HOLD instead,
> dropping the unnecessary ?: operator as well...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
[...]

   Forgot to add that the patch wass against the for-next branch of Linus W.'s
linux-pinctrl.git repo.

MBR, Sergey


