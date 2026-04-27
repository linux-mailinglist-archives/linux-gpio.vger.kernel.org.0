Return-Path: <linux-gpio+bounces-35601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJOqHDx/72lKBwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:22:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C4475192
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1C913031A29
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE663314C3;
	Mon, 27 Apr 2026 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="urpxGyNL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Seb0oU1H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B51330649;
	Mon, 27 Apr 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303087; cv=none; b=tzDeo3M29ztb+6NpSWzxN5F1veJUNaE18XSpzPreb/O6EGcKUs4jvx7bR5uZcfguJWmaH9qZ/Vf19MYHtUKogzjRE978kRc48/+NpFA1onkX2chD9GJxYAIRa9SHfzqzgXr3idcPc7Ur7lDT4wP5PQEt9S73d96ZPc34TigIpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303087; c=relaxed/simple;
	bh=T5XnkGRAYWWNEx8qLlTAVkCmcLueRVg4qlTxLgiNMu4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IzphD/cYXNNjByCAujiOc7Bc5PykHI0HzPyvwwuOg2JdEOKlIBx5McyYuyPMvI5sUuCgETevu8mTGc2nF/xfZbDYMBfK4S+226og4fdw1ir7Z1KAX+0zbidqjgOiu3mI8Ngjj3mUr1iS4FuCz1hBCDQv+4RI+LOe6YPFosNdi6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=urpxGyNL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Seb0oU1H; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F1657EC0266;
	Mon, 27 Apr 2026 11:18:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 11:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777303084;
	 x=1777389484; bh=hYaRI0SZPudNmDi+HcLT6SMoYtUdnCImkMZqOGOuwVU=; b=
	urpxGyNLaw3xhjYZ1L2ak1EMQ8L5kfMuAtqFyNeVZfOrwo4BMKpJybxOAqA0XhrM
	zMyyAIdhXOzVcpjY4Ge4eUIIihf72sqMfpek2v0jxf99c6FR6RQDvtS6NEv44B76
	+I3eXWF1PxLE2ctZ766VhcSnKvtqHl3i4OCoBaMS9GHHiyFcZr9G7P8tO0z7w+a7
	kwKmishaXE1MVXS5/lD0dnp1Yh8zwhltPgCZMuRxs1pj9TsuqKYadz9g15n91DOM
	56vSvCqwAjgFDsKWPWM7ga1QIVUqcjzR5L9bI8bp6mZC7lB/OR9yvmPF66s7KkGv
	6RmxMk1y9s6l5+slnKoWCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777303084; x=
	1777389484; bh=hYaRI0SZPudNmDi+HcLT6SMoYtUdnCImkMZqOGOuwVU=; b=S
	eb0oU1HBqBNiu7vcT0Za+Oj7MfhwBtnKaCzUoH4ZIJxc/VRBuzoS4sCnzlaBs3to
	r4JgTuZwbgvzZbDPIf2DudIvM+iuXz+6b9HQH0szD56ytd1HsvdRdhkms45mbT8y
	rAvm9+PeUAP597Fv2Gh/l0/QIuS1Q56Gj6bJ1rFrb6Ivf8zD0V7/kzfd6AsdxL9M
	Dd4xV4njDd+FbMfS0HOTSlcth996i7ddawnvMMmhQ4EbWUbezUgcQdycHQwzkn1j
	xEbB8JfT4uEobo+vAEL89pAkblTp90HzbRU+Y5lYzyK1QE8/CDcZAqhxAX3VHkRf
	HPh1c7JvsEbJ+yxVUxt8w==
X-ME-Sender: <xms:LH7vaT30mNlPc8k6Cng2HK-BYht7yOcNa-qb8E7M5VH2PIBfmuy1vQ>
    <xme:LH7vac6fWfsSNjA-nNNcWcM8po51DjDfV6PRzMQnLO65T7xq-miOZL5KNvdhrRZ1s
    43CEAt4ld4EdFoQMsPYE-g5n_aITY0-HPThxaUZdFNeoRbq8B2W8Pc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhope
    gvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:LH7vaZ4tyWlV4nb0qrtVIWk1Q9mLdZTuOum2j8EBpJX1cyQgFyxqBA>
    <xmx:LH7vaQSssqy_Krxa6I2p1stX4UIrJEkhl90EpQWN8srFnuaKI5oA7Q>
    <xmx:LH7vaY8TTuox_2cqZhf1SEbbGo3nLaBq1Fz95YhehXNoFXsMg7LcPQ>
    <xmx:LH7vaRpM3S5-mEp1vmkbZL0eElgoKnn4gCjORGtcbL36Y4YxACfsyw>
    <xmx:LH7vaZejMoqI0NTe_McnHrYqmHBEn7cSoJS82ald1iBNwj3kv2O5hZQo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7E48D700065; Mon, 27 Apr 2026 11:18:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5-Su42ZZeGF
Date: Mon, 27 Apr 2026 17:17:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marco Crivellari" <marco.crivellari@suse.com>,
 Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <57297b41-0f08-43eb-a73c-21a5461a4eb4@app.fastmail.com>
In-Reply-To: <20260427145010.GA2502144-robh@kernel.org>
References: <20260427142924.2702598-1-arnd@kernel.org>
 <20260427145010.GA2502144-robh@kernel.org>
Subject: Re: [PATCH] [v4] wiznet: convert to GPIO descriptors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F9C4475192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-35601-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, Apr 27, 2026, at 16:50, Rob Herring wrote:
> On Mon, Apr 27, 2026 at 04:28:29PM +0200, Arnd Bergmann wrote:
>> 
>> The CONFIG_WIZNET_BUS_SHIFT value was apparently meant to be set
>> at compile time to a machine specific value. This was always broken
>> for multiplatform configurations with conflicting requirements, and
>> in the mainline kernel it was set to 0 anyway. Leave it defined
>> locally as 0 but rename it to something without the CONFIG_ prefix.
>> 
>> Acked-by: Rob Herring <robh@kernel.org>
>
> Well, 3 years later and I'm a bit grumpier seeing .txt binding 
> additions. A new compatible plus new property we generally require 
> converting the binding first. But I'm not going to revoke my ack here.
>
> Is there even a known user for this new compatible?

No, I'm not aware of any users neither the old nor the new
compatible, it only popped up from my backlog of patches
because of its usage of legacy GPIOs. From what I can
tell, the only users of the non-DT MMIO interface were
out of tree arch/blackfin/ boards.

       Arnd

