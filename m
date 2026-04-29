Return-Path: <linux-gpio+bounces-35743-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNSvCAmB8WlYhQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35743-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:54:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FC48EDE9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98CBF305A461
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D0E31E85C;
	Wed, 29 Apr 2026 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsT6Kaf8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21593112BC
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434631; cv=none; b=lLqjFCxt4CpHyV72Icf30dO3vOsXReLtEFKaMj2eU81v0Pqn3lBKdISF55ywe8y8/YXStYthjVm/fPqvowDGCN4kxWHPQ5cfWAFZ+CLoM46NYL1AwWeBKIy93YhYvSl5OhNrOErSIIsLDuSdV9AHLQdrOoPoF7ipHUu8OB60Rxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434631; c=relaxed/simple;
	bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-Id:
	 In-Reply-To:References; b=qjyF/96X+oh5c92fpbyZQ0jC2PQOIkdo9CPpMtt3ty5xT3z6MYlWxrgwHwv/qty60d8/3V0YTrvXVcjQKIadJcM6ZYHR276eE3U9sNo5KGQPB2MnumvadnBaxOshOO+fEuI+JCEsEt3M/9XXG5UTKg1iwJ+ulyYjLyVKhC3N3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsT6Kaf8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b299b3c739so56250215ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 20:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434629; x=1778039429; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
        b=TsT6Kaf8eMt9mg+8H2uhOIKn3SIlGkl7fYB35jhVTae+VR6KetsFJMqMnDYxLqj9ti
         g2AMdF327ooldhqGlA5CqGcwWyUPy93MszLQt8XhND9/ydh1aFiYKzRAzGalOlk05h97
         r+i16N0YHTymC0zFTnuIs5YCuv8yZ4lDHTty6mnCfQ/FWwd7EIxEvtedu0+6g4xnP9Wv
         HwxGfiYwiWMF9lfGpHF648fPQM0OLp84Jid2ZvJAXn0OA2PVE1obx8TO22Z+PWwS5bAZ
         HFVcgIpz5BCQdjRY+NValmivHkJXE3B75dy+eshpvmbGy5cS11FE7NS54lFnIReJuP3v
         ocgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434629; x=1778039429;
        h=references:in-reply-to:message-id:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLJ7W6k2uPR0+Erx4tY7u4YyqVWIbtAwQP+bOJG1vBU=;
        b=mKoAFKS1zHNGDwP4nf/9Cdk7kQNRezDxaz//vjThL6GR8ZZTKouDCr+w0+Rq7iT5gi
         ez3iDzuLr425oEYTjwHvofBCNz82TqJDm/dksipweERfZf3zIrwR584IzkDFXWFwCfy4
         VNqh5Lx3mpgVeleAK4zRDpC0qAxyq6Zoc1NvZfxPpBQub0eqjz/fly9TKJADhgpuQJ0o
         qAoZ8UlSFKGigjdtaBIAOA49VZam6Cn8+VFi1364jkrIQuZVxVyP1dqGGKJWXv8gIrGC
         XX8r4ofCqcivVV34CAr6bPG+tEa6gGDj4TThonsLv71QTrPCJ5wW/jrkjmkJY/l8f0z/
         f0fg==
X-Forwarded-Encrypted: i=1; AFNElJ+f/n5//4K1t31YRCQnX8hOQke8ICOojEHFZlVUeaQ3iukpYEgFPRzsdRdf53y55f4mmmZPU1MmkXKz@vger.kernel.org
X-Gm-Message-State: AOJu0YymXlgJOFfBsrpFFByhcexdMiyRyveym3wFQVQ5YqIIy/WEdxky
	Ll7NyBGrLZEjcoWb3AAXldY6g3hh7uR1rzEHSBdzLax1vMZ3CUJjlowz
X-Gm-Gg: AeBDiev7NFufV5As++qA2T/prFRyMchlWsBFdLitRyFq074N4EdiMf+N+21XGh2IOXJ
	iX8+7ZvJAXkMHsGcTgH/tg13hAckibH/bAMf39PAuFHJ6+5vwywiuNcRlBd/fgu+tX1v/DkRqZ3
	5AnTSH3KKmnseudRil7OkKbeB8jZ3dzJckh3dcGIE05DLSYO9cU20dRUFiIpnxuvSZ+7kV4x9Ki
	XIiBR9VnKgLatcJ69ZXiL+is8AOxEplnPRpa/8VtJGFpNuBFjP/eZBahw+gLkz0F8Yh1/kSULDN
	lvuoHlcK72yvr6IdxfS5dyZlYRV+i/F8G1u9Y8jNri4lOjFBzL/v3EQNFC4LQbnYGuVvhQ3STBY
	wU6rtOYunLsR2wQfxpu1toxVVSS0k96fK8Yg0pkt582LzUFr+XpaIJPLzP1lU8/AQXn84S5IuVh
	oLGULj2zqujU8vvdl5qzU/7D0kS1MNERbGkHuzH9G2gSk3hrXYxy7xQ1yfyvFrGA==
X-Received: by 2002:a17:90b:4c0e:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3649207e3d0mr6098079a91.22.1777434629090;
        Tue, 28 Apr 2026 20:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm522381a12.12.2026.04.28.20.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:50:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add
 registers-default property
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2026 12:50:25 +0900
Message-Id: <177743462567.993632.18227713228953210194@gmail.com>
In-Reply-To: 
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
 <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
 <CAD++jLkOZGunkfs2EO_DQDPLnLVp+OPG6o4EKaY5GkAcqYQy5w@mail.gmail.com>
X-Rspamd-Queue-Id: 8C4FC48EDE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35743-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]

SGkgTGludXMsCgpUaGFuayB5b3UgZm9yIHRoZSB0aG91Z2h0ZnVsIHJldmlldyAtIHRoaXMgaXMg
ZXhhY3RseSB0aGUga2luZCBvZgpwb2ludGVyIEkgd2FzIGhvcGluZyBmb3IuIFJldXNpbmcgJ2xp
bmVzLWluaXRpYWwtc3RhdGVzJyBpcyBhIG11Y2gKY2xlYW5lciBmaXQgdGhhbiB0aGUgbmV3IHBy
b3BlcnR5IEkgcHJvcG9zZWQsIGFuZCBpdCBlbGVnYW50bHkKcmVzb2x2ZXMgS3J6eXN6dG9mJ3Mg
Y29uY2VybiBpbiB0aGUgc2FtZSBzdHJva2U6ICdsaW5lcy1pbml0aWFsLXN0YXRlcycKaXMgYWxy
ZWFkeSBkb2N1bWVudGVkIHVuZGVyIGEgc2libGluZyBiaW5kaW5nIChueHAscGNmODU3NSksIHNv
IHYyCm9ubHkgd2lkZW5zIGl0cyBhcHBsaWNhYmlsaXR5IHJhdGhlciB0aGFuIGludHJvZHVjaW5n
IGEgZ2VuZXJpYywKbm9uLXZlbmRvci1wcmVmaXhlZCBwcm9wZXJ0eSB0byBhIHZlbmRvci1zcGVj
aWZpYyBiaW5kaW5nLiBUd28KcHJvYmxlbXMsIG9uZSBleGlzdGluZyBjb252ZW50aW9uIC0gdGhh
dCdzIGEgcmVhbGx5IG5pY2UgY2FsbC4KCj4gU2VlCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwaW8vbnhwLHBjZjg1NzUueWFtbAo+Cj4gICBsaW5lcy1pbml0aWFsLXN0YXRl
czoKPiAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
ICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgIEJpdG1hc2sgdGhhdCBzcGVjaWZpZXMgdGhlIGluaXRp
YWwgc3RhdGUgb2YgZWFjaCBsaW5lLgo+ICAgICAgIC4uLgo+ICAgICAgIElmIHRoZSBwcm9wZXJ0
eSBpcyBub3Qgc3BlY2lmaWVkIGFsbCBsaW5lcyB3aWxsIGJlIGluaXRpYWxpemVkCj4gICAgICAg
dG8gdGhlIGlucHV0IHN0YXRlLgo+Cj4gSWYgeW91IHdhbnQgdG8gc2V0IHVwIGluaXRpYWwgc3Rh
dGVzLCB1c2UgdGhpcyBwcm9wZXJ0eS4KCllvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJJ3ZlIHJl
d29ya2VkIHRoZSBzZXJpZXMgdG8gZHJvcAoncmVnaXN0ZXJzLWRlZmF1bHQnIGVudGlyZWx5IGFu
ZCByZWFkICdsaW5lcy1pbml0aWFsLXN0YXRlcycgYXMgYQp1MzIgYml0bWFzaywgbWFwcGluZyBi
aXQgTiAtPiBHUElPIGxpbmUgTiAobWF0Y2hpbmcgdGhlIHBjZjg1NzUKY29udmVudGlvbikuIEZv
ciB0aGlzIG91dHB1dC1vbmx5IGZhbWlseSB0aGUgcG9sYXJpdHkgZmFsbHMgb3V0Cm5hdHVyYWxs
eTogYml0PTAgZHJpdmVzIHRoZSBsaW5lIGxvdyBhbmQgYml0PTEgZHJpdmVzIGl0IGhpZ2guIFRo
ZQpiaXRtYXNrIGNvdmVycyB1cCB0byAzMiBsaW5lcyAoNC1jaGlwIGNhc2NhZGVzKSwgd2hpY2gg
Zml0cyBhbGwKY3VycmVudCBpbi10cmVlIHVzZXJzIG9mIHRoaXMgYmluZGluZzsgbG9uZ2VyIGNo
YWlucyBjYW4gZXh0ZW5kIHRoZQpwcm9wZXJ0eSBsYXRlciB3aXRob3V0IGJyZWFraW5nIHRoZSBi
aXQtTj1saW5lLU4gbWFwcGluZy4KCj4gVGhpcyBhbHNvIG1ha2VzIGl0IHBvc3NpYmxlIGZvciB1
cyB0byBjZW50cmFsaXplIHRoZSBoYW5kbGluZyBsYXRlciBvbi4KClRoYXQncyBhIGdyZWF0IGZv
cndhcmQtbG9va2luZyBwb2ludCwgYW5kIEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91CmZsYWdnaW5n
IGl0LiBLZWVwaW5nIHRoZSBwcm9wZXJ0eSBuYW1lIGFsaWduZWQgd2l0aCBwY2Y4NTc1IGxlYXZl
cwp0aGUgZG9vciB3aWRlIG9wZW4gZm9yIGEgZnV0dXJlIGNvbW1vbiBoZWxwZXIgd2l0aG91dCBh
bnlvbmUgaGF2aW5nCnRvIGNodXJuIHRoZSBiaW5kaW5nIHRvIGdldCB0aGVyZS4KCnYyIHdpbGwg
Zm9sbG93IHNob3J0bHkgaW4gdGhpcyB0aHJlYWQgKC0taW4tcmVwbHktdG8gb2YgdGhlIHYxCmNv
dmVyKSwgYW5kIEkndmUgYWRkZWQKCiAgU3VnZ2VzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cgp0byB0aGUgZHJpdmVyIHBhdGNoIGluIHJlY29nbml0aW9u
IG9mIHRoZSBtdWNoIGJldHRlciBkaXJlY3Rpb24geW91CnBvaW50ZWQgbWUgdG8uIEhhcHB5IHRv
IG1vdmUgdGhlIGF0dHJpYnV0aW9uIGVsc2V3aGVyZSBvciBhZGp1c3QgdGhlCmZvcm0gaWYgeW91
J2QgcHJlZmVyLgoKVGhhbmtzIGFnYWluIGZvciB0aGUgY2FyZWZ1bCByZWFkIGFuZCBmb3Igc3Rl
ZXJpbmcgdGhpcyBpbiBhIGNsZWFuZXIKZGlyZWN0aW9uLgoKWW91cnMsCkNoYW5ob25nCg==

