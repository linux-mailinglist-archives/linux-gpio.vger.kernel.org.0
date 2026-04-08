Return-Path: <linux-gpio+bounces-34893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAuHA3KA1mmwFwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 18:21:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C973BEC53
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 18:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EBD130160D2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 16:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46407328243;
	Wed,  8 Apr 2026 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TfjNU0Nb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA32ED3A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665255; cv=none; b=L8UrOcZ59UjAtZl39AHWCx15ScLzJTYvGsfxl/7mOxoXQmvmxDj+SQWafyoLdBohdiom1oMb0ZReER92Pm+Vk4/5Q0wfXlecOGiXpODJghyMtp0GRufFo1gY3OGnALbSOcByr2Uy7VuYG0HaQ2udHbt+hY4PmgqGshsNefmhXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665255; c=relaxed/simple;
	bh=TQcE4I7a26JOWNDiOJIzicoAuPbABPsRBghVnDCVJxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHQ8yMnl5O4vATcjQ242IDoyEqKicwczAzuWEr0Gtd0A0kGscuCaSHnEbnUk+wX0+Tn3LF+Rkb8VDBNQJKrLm2l03vL26u3UQ2JZ5U2LKM+cP1MfSlA3bUO964o2jGDqNTLpqd6c7OamadKaVL7C0MkM6v6Sz/t04qrwzdwZIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TfjNU0Nb; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1775665242; x=1775924442;
	bh=XPfSrkA3oWaereGY87hv+CZguWsStb8s1KaSAeumLTs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TfjNU0NbuIv97qPJooiCaxFb8SY2CuZxK18iIECmkO0npSF/huvS1AXIgGaCr5dX8
	 cE0Im4mcrEM4qT5DSsDxSsvVU+6VkSd4vmQCHfF4S7EAwJYpKK6KVIB/WMejKMDRlx
	 0FvyV1pjk1z6q/JYGCc92ryutl9AwrNRlhLJ7TXseJYSJuDP+mdlDNjEyzisjhOeDE
	 nwrHRA8OjoNzurmDkwneIkQwfAj0P3UMaZF6j3hkRuUyZwUAUICrj9wIozlev4lA46
	 LBc9xthE4zX9ywlx9v0a3rFKByOm6QTiJqmIk0DxSXLTtk7rr7WLkmZNR1tfa6xOhq
	 fKFCynIfmOiUg==
Date: Wed, 08 Apr 2026 16:20:36 +0000
To: Vincent Fazio <vfazio@xes-inc.com>
From: 4fqr <4fqr@proton.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio <vfazio@gmail.com>
Subject: RE: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Message-ID: <5W3WCdaDvZ0IgSSsb6LUakqzbZhiNPPBIMH3bjGtS3fHQbiY5PytUPXeVxqfRFuY7tAowBuh_lT2VVygb6mULr4Yk1chnzrXoC-hKTnyj44=@proton.me>
In-Reply-To: <PH1P110MB1603099998E166048F432FE29F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com> <PH1P110MB1603099998E166048F432FE29F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Feedback-ID: 175532996:user:proton
X-Pm-Message-ID: 3dca644bd731a4a85c89508f8daa9f205deef8af
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34893-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[4fqr@proton.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: 74C973BEC53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hey everyone,

just saw the patch series. thanks for taking my report seriously and gettin=
g the fixes in.

vincent, seeing the tests pass on all python versions was a good feeling

bartosz, appreciate you giving credit even with the "maybe ai" note. the ai=
 just helped me write it up along with confirming the bugs i found. so yes,=
 i did use AI. but nonetheless, glad to help! you've been great.
looking forward for more contributions :)


                          - 4fqr

