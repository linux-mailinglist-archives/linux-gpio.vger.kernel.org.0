Return-Path: <linux-gpio+bounces-38726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHePJiWWNWpP0gYAu9opvQ
	(envelope-from <linux-gpio+bounces-38726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 21:19:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A46A779A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 21:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm3 header.b=MGWyBY0b;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="a AUb1mL";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38726-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38726-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A1283005E9A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 19:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A018933F5B1;
	Fri, 19 Jun 2026 19:18:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16732A3D7;
	Fri, 19 Jun 2026 19:18:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781896734; cv=none; b=s8HR3s2KhkrQO5ebR1zEUDQEsU00EihKHUfN53PaDWBGht9okiy9Tg7mNPoOWXSH5Sv2kUs3zeFKFK5rMsrMONFpZxEnY8GMpeQV4nVVyJ/1u/RObQ8RUq5UmCHfwEfD9qJWUMHpOMjyPj9B97U6AjjZTVLJVDkOVQjvkkURKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781896734; c=relaxed/simple;
	bh=hN0ePi8N+Z7F/p9FDSPQHQnzENbJwFsntwUrrMsv3WE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SgYSzdI3tqYmlFIfGbcWZXREWxt07lF/Txvey/9w++Ihp4n/Rjg3vslDTLTjIx6pOUlm1ezXQuLmaTAJQvdbcB5mbqy0GenHER9FZPnRdziF1V0ePKTMpvMWCsaSYr8oCYpHuCgzSsVdt+a3EyjxEWBkmVV93db/F10l88PjI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MGWyBY0b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aAUb1mLn; arc=none smtp.client-ip=202.12.124.147
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 802641D000D2;
	Fri, 19 Jun 2026 15:18:50 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 19 Jun 2026 15:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781896730;
	 x=1781983130; bh=WMmaYqcpj5qFPBbHXMKSxFB7Wq+hKotmwq9lR4Zk+sg=; b=
	MGWyBY0b2Vpa5SbeOoCaHd7LeP1XXkLZl2I0hco03NvQpBHKRGMqk9uaJu29E4ES
	ZSptCouPNO3K1BbIITyL7tl81AVtIHMJOHBQbuCPgecXCKmv/yEnV/CS6HQ2PpCB
	N3uXtZIgil16ogc+o/IpOKRjbWSuYXdxWecPR3BYMv+2s+fqQk6qveFmqFJvw2rD
	EG6YLk2RCgOEcsVRV/MYGWmxzY2TnX439brV300W6EV3Udrc7fYgwAZcFnD4p4dX
	k7ufO75RVLll3ql5jo9bfVm0BTgLYx7iCwFl4RJzdmegIOldoA+bpe4HUK7ljS2w
	VSOUseCetYaNb6CdlnHn+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781896730; x=
	1781983130; bh=WMmaYqcpj5qFPBbHXMKSxFB7Wq+hKotmwq9lR4Zk+sg=; b=a
	AUb1mLnG3NRW+BTlcQ6gE7agaiElxEsjlSsOEFQv7TmStYThsonUub+Y9wmhq/UX
	w5FQXavNfgOPLGScgIedj0P4L7cHMmK5U7dj7nZeHAF2Vch9ATME9FaUqt1rLzoG
	BzpenwWYNt0HhJ7ClUQ5lS/QCD+6IViNV1GshFNAG/UFMRbcqTeygT2/PzEMxH35
	75S5ahevfnRo+ANx4csygvKhYQcWly2+gJ9Q4gHTcNO8QpzQKs3QxhR7IoCDzV1u
	TpwULVn0KQ+/bVlv11QAWjP1y9QKLFX74/Y9sqzzre5F6lnSdLj9mA7LNxedYlRV
	RVy5Cr6YxHy9vEo8HIxKA==
X-ME-Sender: <xms:GJY1ail0oQF4zqflss_nqWzFvweWbFuhrTHF-nZRwd7hhkaJBbkE-w>
    <xme:GJY1akofdj9rdg4BYOVAoYiljcFLCywCTd-7p4hyKIyunbHUzvS-btKZVKRFAHNfM
    Kdt1xksGs3OwM9ML3pflo65LyLAggQHqXFFT6QONswTfHcI_Ah9kJc>
X-ME-Proxy-Cause: dmFkZTFxwm0eoO/ubQ6vEXwkN7gu9uih52cTPfdC2KKT/YbaCqdV74DUlwbxDlQ1eX/AJb
    LKb64YTQgPoISp+PTWQdWzNil+OmtwAWnWyYjnoOczuy+3cPAlZux6RZHQSXuI/Lp4KgjK
    vUGwLuxoK1IU5E412htHREbsHNYpd18q6ckMVLTC0jYuOf7BdKrn8fqXTW2QSUhnN0FoHN
    vFues5Pfb92i6pWuaydZ/Uo/4AQp6Rq/0sAI5c02HEfElIpkJL80Of7lf9BTo3h4exQOxC
    UjmlHkR5kc48/ma9mjCkyCStVFntqnJK+EKBJLZ5D0y9EiaAnIyl1w7s9xoryHn6uTXFhQ
    TxDoRPTd4rLyrL1T2oMFZ5b4W4Iefc6tzVZtsT2VU/wqmt5WZin87Ho7gR+ktYrDsYAgmF
    9/i9UaRN3uKxf3V4HhnlKsoOHyGA7QUii5kQGXVjcLwErJHdHDTgD6+4gTHPX9C9V9PCcv
    Flr8I0ITlQWAMeH55hIqIfjDzHlE5pyLPDsZpmlKny3BojEHwDhdgt/iLyT7JnflRTGFlF
    4Ee10aS1Viq8noR1nzW+Cs9T2IPvdmaRoeD0idLVGnvgIVi8JclG8MRxJ9ClSZdQtekUnq
    W4lE2Q7q1ZSPjwDdxAzVyt/Tzo7IO5huzk//IKNJgVyUQyLK7ftY1V2pw8hg
X-ME-Proxy: <xmx:GJY1apQVZQn0fUcUg_pMom8vHeGZJkSGXDUKzHwMPbGLRnxlHdz0bg>
    <xmx:GJY1ascKauvynt-2QyEb_BVfCFip285HKqf535gjQf5J_sdu57LFwQ>
    <xmx:GJY1auKhqgL-MEwStOIXYdL9FMrRYQXXXUSRus05CsUPS2CJIzZ37Q>
    <xmx:GJY1apEXcbi2cM1z-xp4ZZYMsbvr2qayLkPROzh-xwsRcf1Cznogkg>
    <xmx:GpY1auf-tP02Dc0COI_6I8-4aasP8pZuMJc-VIkKF2q0n_Vmi11zrxjR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD722182007E; Fri, 19 Jun 2026 15:18:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A7dmd8TY8zEF
Date: Fri, 19 Jun 2026 21:17:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vladimir Zapolskiy" <vz@kernel.org>, "Frank Li" <Frank.Li@oss.nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Stefan Agner" <stefan@agner.ch>, "Fabio Estevam" <festevam@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Abel Vesa" <abelvesa@kernel.org>, "Peng Fan" <peng.fan@nxp.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>, "Linus Walleij" <linusw@kernel.org>,
 "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>,
 "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hardening@vger.kernel.org, "Frank Li" <Frank.Li@nxp.com>
Message-Id: <06498d0e-662a-4c09-b1b0-2a70b6168acb@app.fastmail.com>
In-Reply-To: <7d946861-c3cb-4512-9d5f-9f4cb9b7ee8a@kernel.org>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <7d946861-c3cb-4512-9d5f-9f4cb9b7ee8a@kernel.org>
Subject: Re: [PATCH 00/11] ARM: NXP: Drop NOMMU platform support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.nxp.com,pengutronix.de,agner.ch,gmail.com,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,timesys.com];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:vz@kernel.org,m:Frank.Li@oss.nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38726-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,arndb.de:dkim,arndb.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2A46A779A

On Fri, Jun 19, 2026, at 18:07, Vladimir Zapolskiy wrote:
> On 6/19/26 18:40, Frank.Li@oss.nxp.com wrote:
>> Commercial users and hardware vendors migrated to Zephyr or other RTOS
>> solutions years ago, leaving the NOMMU platform support effectively
>> unused and unmaintained.
>> 
>> Remove the obsolete support to reduce maintenance burden and simplify the
>> Freescale/nxp platform code.
>> 
>> Some driver code still be kept and may clean up later since it is possible
>> reused by other SoC.

Thanks a lot for going through these already!
 
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> This change is a bit too early to happen, I prefer to get it orchestrated
> by Arnd. So, as for today I NAK the change for its NXP LPC part.

I am planning to post a series of deprecation notices for platforms
that I would like to remove for one reason or another. Since it's only
one more merge before the next (S)LTS kernel, my idea was to post
the series once v7.2-rc1 is out, merge it into 7.3-LTS and remove
the deprecated code early next year once the LTS release is announced.

I have rebased uploaded my current draft to
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=rfc-arm-deprecation-7.2

None of those are finalized of course, and we can do any part
of it earlier or later (or not at all) if there is a good reason.

If you to remove the vf610m4/imx7d-cm4/lpc43xx/lpc18xx portions
earlier, that is definitely fine with me. For imxrt1050, there a
slightly higher chance that this is still used, so I would
prefer to wait for the LTS kernel on that one.

>> Frank Li (11):
>>        ARM: dts: vf610m4: Remove NOMMU platform support
>>        ARM: dts: imxrt1050: Remove NOMMU platform support
>>        ARM: imx: Remove NOMMU platform support
>>        clk: imx: imxrt1050: Remove NOMMU platform support
>>        pinctrl: freescale: IMXRT: Remove NOMMU platform support
>>        ARM: imxrt_defconfig: Remove NOMMU platform support
>>        ARM: dts: lpc: Remove NOMMU platform support
>>        ARM: mach-lpc: Remove NOMMU platform support
>>        ARM: configs: lpc*: Remove NOMMU platform support
>>        clk: nxp: lpc: Remove NOMMU platform support
>>        pinctrl: nxp: lpc: Remove NOMMU platform support

>
> NXP LPC32xx is ARMv5 and it has MMU, hence it's plainly out of scope of
> the proposed "dropping NOMMU platform support".

Agreed. There are a few more platforms with MMU that I would like
to drop because they were never converted to devicetree support,
but there is nothing wrong with lpc32xx. 

      Arnd

