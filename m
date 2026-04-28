Return-Path: <linux-gpio+bounces-35707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8InvMfTR8GnDYwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:27:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E1487D1D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 17:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A2503073588
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEAB42B720;
	Tue, 28 Apr 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DOOlaxgR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SnSWHZLE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5A4279E7;
	Tue, 28 Apr 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384654; cv=none; b=lG9+RZ/WVJPF0W1JDamOl4vwPbB6woJ+tVbF+hZabbYqCNx4MDqa8qDJTUojDY1uq96lQO88sVXBrDqD9JzPnCKcCmsurfGmWmcf5Jg+Jk87YoU5OWsgZf9sJm5b1cgJR9n2kwbFyoTIXqQKQLCzRVerE0u643E8fIezpkWRC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384654; c=relaxed/simple;
	bh=q3Hl1nVOQfRhHn+cDPDtpnSNAOnm1kFaAMCoY31NU5M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iLgqRJRzehho7VFHLR0jwDoNOHXAP3UM+6W4uYVo1ClMlx3lzwKAYYkEDFSW2/2SZ86xZODKdu0SCpm4cPxOtSh/iZVYn4/RTnCIhCLIyntUzdoMMee64uSpTpM/49keLD3SnM2dsaU3+y4P8bn/PEfXmVeXq1UN1XoV2JiVHOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DOOlaxgR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SnSWHZLE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A404B1400039;
	Tue, 28 Apr 2026 09:57:31 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 28 Apr 2026 09:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777384651;
	 x=1777471051; bh=1hWRIKHI9M656vUhaN9NG60ADnGaNgrqoehuR4bNgXY=; b=
	DOOlaxgRSwg0rX5ZGLTnok42M/ajAjpKWD5wJV3NRNtuYLORA00EcUezLB4STeED
	iYy24WBkoAJhPjW41NX9Ay1DFreTSKrBt5A5FXdA3klkySNTCp1+InuhgUqUwLTC
	t8Sbf3KmwUCk6nOynlAPpSdXLpdcWMjDePFB2LlMIzCZV9cI5TrqtnFJZIUD52nY
	MaTtpaoocXORn6E+6GRimw3xFua8Y0fpDvRKoW0xdVWElgr/SQRFan13OP5KKAqn
	Xx7VIA9rRaby8iydvpWLm0Jmc2KJ5qgc2ptmI7GkTZHnE3ibHcSZO5eqMHdiuGva
	2xUev/PekMG+FrIFPdffxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777384651; x=
	1777471051; bh=1hWRIKHI9M656vUhaN9NG60ADnGaNgrqoehuR4bNgXY=; b=S
	nSWHZLE0N7L06ZClwiH144Iaym4iicUffXq/ug2k+IyiRlTCLRLggTYVM1Z49Cj1
	1ysfZxHIBD02uQs2PkC7iL/QCUfeMP+Dkqer3tN+r2Gnf/sb83jSD477FNhNJ+Zz
	uPlzatetnbkobIWn9pcuoHHQeg11TlkTmK0YsIMERPpk06/jB/fFCNf47NGyws/6
	/x74fDdLiUwBfkFwmdLVDFX4009iZnwXHng37j+0yjomzAs6VWAxC3yPoGWD63SD
	QYMnm+wfCG24pYmAvwfzelUvzYcBmB48nd1xmOrSp58PbIULmulb83yE3kjI1Ogj
	TAOvxR4fsmFiSWfqEcV3g==
X-ME-Sender: <xms:ybzwaTKrXmX9PFG9a0hX3yEo8I0fSHEZeLYqePqPI10EkRZlKe2nWQ>
    <xme:ybzwaR-kxECdpBQ8kLnb19CxVcEbm_WLqsF89M41p_7Lb0xNO0xFIqTE2UsiDzudJ
    7dqsRzhpDjtCT2IAUGE1wXCn2JkH9u76tgddbkh_uZufvvnfUu1ATc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekudejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhiise
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuoh
    iilheslhgrphhtohhprdhorhhgpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:ybzwadCrAm-6CfkGElUwNJoqeTRwjppT8SCZ7Z7l5RQso9L0OpRIlQ>
    <xmx:ybzwab67TjhJL8-F-ksR3RFATYiDVZRkHxB2_g3o9QVDFD5BrMaC5g>
    <xmx:ybzwaZuxFAyqjuf2sFVIbK0FthUjzQxq69hZLcDo35cPRAAu-sWZFw>
    <xmx:ybzwaTySFn_EMyneJb3z93jmA1TELmjFAy1ONrXY6IWYS2AQoCYZhQ>
    <xmx:y7zwaaGVrsnYAEyiaJiMtEipZ_5dtBnLhjl06XkanYJ3G1uanQvLKk53>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 933F7700065; Tue, 28 Apr 2026 09:57:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATt-TkTEJJAR
Date: Tue, 28 Apr 2026 15:56:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "James Cameron" <quozl@us.netrek.org>, "James Cameron" <quozl@laptop.org>,
 linux-geode@lists.infradead.org, "Andres Salomon" <dilinger@queued.net>,
 "Lubomir Rintel" <lkundrak@v3.sk>
Message-Id: <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
In-Reply-To: 
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
References: <20260427144338.3436940-1-arnd@kernel.org>
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 626E1487D1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35707-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,app.fastmail.com:mid,arndb.de:dkim,arndb.de:email]

On Mon, Apr 27, 2026, at 22:13, Linus Walleij wrote:
> On Mon, Apr 27, 2026 at 4:43=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>> Select CONFIG_GPIOLIB_LEGACY for this platform and make sure the
>> sound driver portion cannot be compiled without this.
>>
>> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> I started to try to fix up this driver but it's such a mess. I feel
> the OLPC XO1 support needs to be deleted unless someone
> steps up to actually test and maintain it.

I understand where you're coming from: the machine was certainly
never really nice and was already quite underpowered 20 years ago,
Pretty much any distro that used to support it has stopped
years ago.

On the other hand, even the XO-1 was widely shipped to both users
and developers, super durable, and influential. There are a handful
of other upstream board files for the SCx200/Geode family, but this
is probably the most common one by far.

I see that the display controller driver (olpc_dcon) was removed
two years ago after being broken for years. It was first
removed in 2016 but restored immediately as there were still
users at the time.

I've added Andres Salomon, James Cameron and Lubomir Rintel
to Cc, they may have more information about who is still using
XO-1, and if anyone is still updating kernels.

       Arnd

