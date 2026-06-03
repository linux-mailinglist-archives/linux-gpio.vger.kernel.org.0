Return-Path: <linux-gpio+bounces-37889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q3JIA0rtH2oksgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 11:00:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD18635F2F
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 11:00:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alex-min.fr header.s=fm3 header.b=NP31gjgb;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="M JJu0O9";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37889-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37889-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4135A307DF85
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09CC43C04B;
	Wed,  3 Jun 2026 08:59:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C8040910D;
	Wed,  3 Jun 2026 08:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477190; cv=none; b=r/48zY1OExHfR6H/DfiyqW7NUqHdngHi3jkttTXhjpCnbMKvKX698Fspj/6WHhryQ36umJGJU2Sbx50Yec7+8CKo4ALQ+cWtNE9QTaHO2e9Tt+MFvc7CiNmd8ibFexDkKBRjb4IABR8s1HgMCBQd9CPEv++RF4KW5vw57dYzTS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477190; c=relaxed/simple;
	bh=ztF4BT8IElW1EAM/iUON2PhtHHt3jm5Fed4urA0d4bY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CgoVW/ez4XMaUzJDdHMfQvp1SGDHnI6rM9W6hqZWaOzm6wXlK/ztN/IEosf0JqiV9qKvX3RY95//kWScX0IEkS8G6EW42KWRHEtA2NlJJtaCnfjLvKdGrZYvL10ZSbkuxizZUFX9eFueP/j7p617c/fLxMFx+dzHxWREEGsv7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=NP31gjgb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MJJu0O99; arc=none smtp.client-ip=103.168.172.150
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8062AEC0143;
	Wed,  3 Jun 2026 04:59:48 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 04:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780477188;
	 x=1780563588; bh=R1Luc/aCcjuMXa/T7EwpzALBWVDdnlVy5kkRX84+U+c=; b=
	NP31gjgbIgevccQrrzt+pHO6DNbMEDXbovqL00yLhEcwsVcOiopH3zkpkQQcSYy7
	70vc7AMKe4l2d2hAbJech94LF9Wg/cwk6RJqbyGQL6z8gMjKl3hPhdMsj37U2RJE
	sX4dZrw9Cf+J0c8uuQ2trzjABgoqaz/FHf/JkHUuIqsMsEMI6Yj0fupIpKs0zwH7
	rEQcjcVjAWrLRRImy+0na+cYtNAFIKBLBpwVpJ4dFmv1IWNECX+K5ibVuO+vYxUU
	+B7Ffa4d4LsnVD/14p/IvaM1R1iFU8vgpWTo80Y5+UqCEU5+MxqgFtVjNAY+XS95
	Je6SKaK5m+5SSIzjnHPjFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780477188; x=
	1780563588; bh=R1Luc/aCcjuMXa/T7EwpzALBWVDdnlVy5kkRX84+U+c=; b=M
	JJu0O99bA2f7xQ418KgOl/UV31AmRfJfsjegbRJjA/u8EHt2AuljdpF3QtVomOEE
	XCaWdSoNve/2zCAj926ODXmm9XM75U0MP7tmS3rx5LyALgxDEUK3Y0tnYdJF/5ED
	Wh/HX4C+WIfFXPjvuOKRcHrXIRZxhuMZWew9FFPs22fWjEQPAFfd9uU+vu0hSeFJ
	tD01AloNAbPH+G8mGOkIp24EXYgJIqMH4JAivtXOj6fYLVlzszZxgt4wLMqpuWd8
	mtG6eCHQo/lmdmFoyN1rrdtAJKpzywO56YTK3xR/TWxhETBY5Yg8oSj7BrRgjQ/8
	g3Ossyo27KUw3CYue34JQ==
X-ME-Sender: <xms:A-0fag7oca7qikHhl0CUlyQ_53SWDB-q2wFdji-Vs03jMoC-a-HxQA>
    <xme:A-0fass1c4lY-jFyIIejqJycqgwJMLoAy1EUXIga89fG-BiCUSKY83woRZSoHpxGr
    Of2QSTrH7Z9URV9VTKpsGSXG7igZNIqMB7HsL4dhVCYN4FM9TQgiQ>
X-ME-Proxy-Cause: dmFkZTFEF1p3KY1NI3DS2ef3AXrVnrQiXettYjJNovNV+TA2YH9EdcHk0MqZ3oV56NdzN0
    dTAKPjcvgZhId6ng7Q7btgM/a1BfqL5ySqk7elTgQKa6D+uaqSDBpMabDcWgOSZqAe4cbS
    KNKPcsz1ZMoTzI/Xn1nfYU/M0xfTbeacep83OJnEB6HVMbAeTovgL7l9dX03eghfWf4nCE
    G2pMY0/IjA92D/9AHm9m7xCGQ9o1y+1XWy12Ns4tw+sii6/EmcIKAUNdcQheVNVYdPiOK8
    EEQ9MAd5Jp8FJkSva58L7zgj7h9FZCxttbf2IoK8Jr8GNq7hUL/LVYiWloIUc99h99lJG2
    3MUxtLAdX4qJmjgBVLj5jn/A439aoTViYV6hd4sqfI6FXF3NG9mgrWW4WXTdsgW05Gjftp
    lkELPwCAn0DJ+qgJ13sER550EkSkx8YQNPVa513pWyf2BbY6IciWnRdqN+uDV/0trW9Mty
    2crlmLnb5W2h1kfMDpmCj96YPZnRhCujfsWaGjr773QDoVm/dYA+Ti/H1VH0vaQywnusZW
    3GCRuJhL3yfTGzqgZrcTikg+RcsOQMmAepSe8TDpzmuOE+b1+Fz0HCk63f/CGKL1Vmi1JR
    RjIdhP4zB43gz+ZB21Deq+fFZIwJTmymzKZMw1aBSnS45EtrHwIphvc+tHbg
X-ME-Proxy: <xmx:A-0falU_FTpjDg238smBDQJz02CoF2cadVuCUA6R8agbzy-yipebNg>
    <xmx:A-0faglmKlwi37cTbjl1oSNIrLtSzIOLY6YL91Puqg3ASxvLZmrWpA>
    <xmx:A-0faoDazQIU68o916ZPKciFCPk7o5VJVAUIhbUBVuh45lFpABJrlA>
    <xmx:A-0fal8aPpF2IdqYVglSw29VfVI4GlkkDiIYe2knCXa3xRORw56mKQ>
    <xmx:BO0fav02tdSAa5_psnn6ISbiQ3n-1LGZL7gAoC72F8j1om3cVFyLJAPF>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ACAD018E0074; Wed,  3 Jun 2026 04:59:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A511MZycEBGs
Date: Wed, 03 Jun 2026 10:58:24 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "David Heidelberg" <david@ixit.cz>, "Linus Walleij" <linusw@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Guru Das Srinagesh" <linux@gurudas.dev>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 phone-devel@vger.kernel.org
Message-Id: <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
In-Reply-To: <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
 <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
 <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling pinctrl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.15 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[alex-min.fr:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DMARC_NA(0.00)[alex-min.fr];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[messagingengine.com:query timed out];
	FORGED_SENDER(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:linusw@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37889-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@alex-min.fr,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[alex-min.fr:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[contact@alex-min.fr:query timed out,contact.alex-min.fr:query timed out,linux-gpio@vger.kernel.org:query timed out];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:dkim,alex-min.fr:from_mime,alex-min.fr:email,app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CD18635F2F

Thanks David.

I initially considered adding a Fixes: tag, but I do not have a commit I
can point to. This looks like a latent ordering issue in the
Qualcomm pinctrl probe path and could have happened at any time until no=
w.=20

The failure became visible on APQ8064 boards such as this jflte, and I a=
lso
have a report that the same change helps flo/deb, but I do not want to
add a misleading Fixes tag as we don't really know which commit really t=
riggered the race condition.
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Mar 19 mai 2026, =C3=A0 23:03, David Heidelberg a =C3=A9crit=E2=80=AF:
> On 19/05/2026 10:48, MINETTE Alexandre wrote:
>> Thanks a lot Linus!
>>=20
>> This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but =
I also
>> have confirmation from another contributor that the same pinctrl patch
>> helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also bas=
ed
>> on APQ8064.
>>=20
>
> Hello Alex,
>
> if what you wrote about asus-flo/deb is true, then this patch should h=
ave=20
> `Fixes: ` tag, as I remember it was booting with few limited patches ~=
5 years=20
> back then (only one serious was hack for proper clock bringup).
>
> David
>
> --=20
> David Heidelberg

