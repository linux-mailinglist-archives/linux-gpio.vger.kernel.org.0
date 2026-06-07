Return-Path: <linux-gpio+bounces-38055-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUKPCn73JWq0PwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38055-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 00:58:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFD651DB9
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 00:58:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=reactivated.net header.s=default header.b=0qp+GHP0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38055-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38055-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E914C3001FC2
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2026 22:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB373254A2;
	Sun,  7 Jun 2026 22:58:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out16-31.antispamcloud.com (out16-31.antispamcloud.com [185.201.18.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5B26E165
	for <linux-gpio@vger.kernel.org>; Sun,  7 Jun 2026 22:57:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873081; cv=none; b=pn5LsZq1ET8aEfejcJd1zcQQRodt5GohxmkCgG0GOZj76O9GVAhjBbMpTEcvqNAoejw238OM4Hr0s9RPRN0SeaBqpWdoXBeM89WUcoG7sPhZ+EY6YL1Gjzpm74TQRqCc2jRrst4/slM0dMtZBxXxSxGnelIobMpeq1/8qFVmVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873081; c=relaxed/simple;
	bh=uz3FXJ9DomsPbEFD6JPD5S8Gjeg0Hr1cb/v2CpjyB0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRXZZYoC/aU3uScJ548XQEH+8WOsCYDY/mBTi+pqZhZDOssB6m/7E+i3ciyyXQJgvO3DP/PExEoYok+9z+cG5nBc6F7KyAiGExGCXB1E7T6z5AXu0/vlDM69QdVGykz44N451ewFQloP1Oi06nVPdemFqPRnpv5VE5Ke1S8VQt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=reactivated.net; dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b=0qp+GHP0; arc=none smtp.client-ip=185.201.18.31
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx207.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wWLUo-007FOl-QO; Sun, 07 Jun 2026 23:57:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tdMeoOld4FcgA8FppLQz+Ntxpynqqdfhs7oz1KaTiq4=; b=0qp+GHP0eA9XT3azcraOimorzL
	WIBUZUwgyiosJW/rCM74G0Arze8Kw3E+L300TcPwsOPjZ2UwfS8dNAMczdb96wzTbGmLWh9UUJFj/
	s5YbS/Lkj1DnhJjcOc1wZwbZjBQI1XeoaE/CpRHGgOGaSTXgHlabeD1rUGRRqR5A5vfROydFiIKGz
	rumvDg/bjMWZO3zy5pgOGi8rwCm8oqamC5njPiOuikplMxjv8srdCbEQ0+c0+grlkgnU8O96RBR7m
	obQQjJzZDZ+7D+cEV4MiCshzQBMRK32zwk7NfqZSZQP1oA1oExQumEyIx8eLICfJJgndFfnWwZw6w
	EyQu0q4Q==;
Received: from [188.251.249.2] (port=34882 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wWLUj-00000001qw4-173O;
	Sun, 07 Jun 2026 21:57:25 +0000
From: Daniel Drake <dan@reactivated.net>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH] gpiolib: handle gpio-hogs only once
Date: Sun,  7 Jun 2026 22:56:47 +0100
Message-ID: <20260607215647.112488-1-dan@reactivated.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXsLW0z+VlcfY/wMv3CJzW0CkmwZvl1sHm1
 KmFO1CRnJCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPSJ5FdNqHijoQ+Lk8NzN8YGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAg1NJkF77+oGQ+lxJlCrsUeB7itP8hgjDRserKv4bhb5a9CD46iTOjXEpJEwP3fd9WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvW7iH+6DoE8NeDBUxImZIxHxsBXq5d
 3sVlH8/8/BVjaCxdqoPv0tTPBZ82RqaKH6ZJMkXL9fD6+WIpcQ2t8oQM/WEMAHr5BYwqeYfWeqTu
 1YC/tOVjI4dWyTvfTQXGjT+aEfC5mTBtCltny75g3MKubALAOajlmHbHzeutXs2uHosTaX/E9TB8
 42c3huE/T1c93SsS4aMXJmiJ2G0eb5ahq2kqyMRk6DLUUjpi54Q90umYmC9jerRVX9sTO+FXU2n4
 L0nk+TooPV1h2BXu3/c8Dfd/7JO6UaIAUVkvSizih0TzynhIhk347ucixeDFxznIHYi/jghIJpVk
 vIZQze0Bc4OP9WjPZ/cr5H8qZypgvgrWxILsnce/vzk7Sg5HsMU105o7Arb8LdgQkbIszV2rqXUJ
 pkwwvtJ3eaqr64J65gYh+EkDZ7F844A3amCNzUUxeOUmb7f2sSZgwwfArL3kN4znUXS+aQ2Zqid5
 ZhuDgwCeIZyBg7HvH2nIa17LbgjKuFO+2mEj3Ei2hTvWconvzZPs/pnfZDHCBKz5ZsfM43T5M7YL
 w6LVwB8ESiQZrfYccBIk1Sag4dKiqCrF8eZZNLgqwwzqzRhdGeE82QeHCPMhVWUJ6Lbki9dM28Lo
 JGcCCe5x6ntEzvieEb+fqTMfTu3UcMCRWk93tDX2xq0IRHaigWR4GmnmvyoQF7RljOE5Dy0kIn1S
 +xE6dEa4ITSORxoHJPO7jtECLiprxnxXDQkNiSsY2JE82yoZXENc5iBe5UBNo8b5j5EtxVNpEcGW
 Tu3UcMCRWk93tDX2xq0IRHaigWR4GmnmvyoQF7RljOF2PyW5cLuSbbpC1c/2zTYs
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[reactivated.net:s=default];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38055-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[reactivated.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dan@reactivated.net,s:lists@lfdr.de];
	HAS_X_AS(0.00)[dan@reactivated.net];
	FORGED_SENDER(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_X_GMSV(0.00)[dan@reactivated.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[reactivated.net:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0FFD651DB9

Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
behaviour change that breaks boot on Raspberry Pi 5 when using the
firmware-supplied device tree:

  gpiochip_add_data_with_key: GPIOs 544..575
    (/soc@107c000000/gpio@7d517c00) failed to register, -22
  brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
  brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
    with error -22

gpio-brcmstb registers two gpio_chips against the device tree
node gpio@7d517c00, one for each bank. The firmware-supplied DT includes
a gpio-hog on RP1 RUN, and this gpio-hog is attempted to be applied to
*both* gpio_chips. This succeeds against bank 0 (which hosts the GPIO)
and fails for bank 1 (which does not).

In the previous implementation, failures to apply gpio-hogs were
quietly ignored. In the new code, the error code propagates and causes
probe to fail.

Closely approximate the previous behaviour by ensuring that each
gpio-hog is processed only once. The handling of gpio-hogs on a DT node
with multiple gpio_chips remains a bit incomplete/unclear, but this at
least retains the ability to apply hogs to the first gpio_chip per node.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

This bug is only exposed by the firmware-provided DT that has the
gpio-hog. The DT shipped in the mainline kernel does not have the hog
here. I'm not sure to what extent Linux cares about supporting the
RPi-downstream firmware DT.

I'm also happy to consider other approaches. This multi-gpiochip setup is
a bit weird and gpio-brcmstb could perhaps be converted to register only a
single gpio_chip covering all banks. I verified that the other drivers
that obviously follow this same multiple-gpiochip pattern
(pinctrl-amlogic-a4, pinctrl-st and pinctrl-stm32) do not seem to be used by
any board DTs that include gpio-hogs.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..fc4dacee0a84 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1031,6 +1031,11 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 		if (!fwnode_property_present(fwnode, "gpio-hog"))
 			continue;
 
+		/* The hog may have been handled by another gpio_chip on the same fwnode */
+		if (is_of_node(fwnode) &&
+		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
+			continue;
+
 		ret = gpiochip_add_hog(gc, fwnode);
 		if (ret)
 			return ret;
-- 
2.54.0


