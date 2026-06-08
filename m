Return-Path: <linux-gpio+bounces-38068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+6xA2twJmoWWgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:34:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB9653926
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=zXqWonrW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38068-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38068-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 176D3300611B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 07:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7103909BC;
	Mon,  8 Jun 2026 07:33:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662C38F646
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 07:33:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904038; cv=none; b=nonaNG3sC5oO9CGb95d/cFuZNPxPTZ7P9bKIkUWWblixcR8FpU7y4VbGZqYWuFGNdSBdjn9cVnf6WQus+GwSFsER7YCp5Hc+GOtTnCkAbis+m1Vpb/1xDXZYcwC8/iUyw7okiod0DcRGspv4Acgr5nM6/rj9h63sSiK2xIUqScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904038; c=relaxed/simple;
	bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=p4ekeJXZq12bNu2vsuhYjlbzY4X7kHXS54buTNXDQ/NNj6Ms9Gz4+xrGSxIeSKWHpLYn7Qpw+JbjxVb9tr7gmCQpvo0FxFJDOcLH6mn2BdamQeb9jIf0vomjoUexBCVC0bofTzrH1FKTfTkx9A+lDRnSZAK1EcxXO+zrITQ2z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zXqWonrW; arc=none smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so557465466b.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780904036; x=1781508836; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=zXqWonrWFhauWO395Q9+0HIxwy4vwO+PkgEKGSBJ1qpZ1bh/XpORsolDvvzCSIAXQV
         gUnJRBUtelCcgqPdViQrVpbFb0SNlYumwjdWwxufnh1zbgg6W/0RotckB/ZtiA2UjMDR
         WE8U12rGibdjlyPDBrlyr+1/c9TOOlSXBEiwCCn4UxKtp4SWto0pfFfFDslBH6uKAo5R
         6mVJKPKmGI2wJwT6bwLQEQwmwF5zkAj3NOWtYwNkQ30frILx5J4D/6ZqTjemYVKew6MS
         gL4abfzJo0jsX0pBDpaO4kiKHplWefWimnG3emrWrb3zR/8EhLBbzFS/+OX43neTAl5/
         8LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904036; x=1781508836;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=BvDzb2uDuierq/tNi5EBfvFvI1Hb4ie1wf4ptTjg6U40c/FdhV1HsjYb3GjDFuGLIZ
         nHBLWVbtc52ZmghRhk9OcKpZ0dtmdic7gJT/g99EiexA0xWcjiKYbj3pms7Scp1bT+K7
         xEtJaf0wg+rmca0OaWd4n9VGQtFpzcHoeV8hcIe0btxVHXtlGyGmybT0Q/97bcCCljZB
         UwqyiJPSL3LJaGVzUodkpGt0mGmWKt0izTdUAdFPO9CYXhcvuEPdkexoTPdFo0Jn1RNK
         9faxHVjDcvV6FmzkO/YuWvR8Xrmx+lJuhU0i59Pl06IgRKFAyzmuWPW8G1Phdlk84O2z
         MrDA==
X-Forwarded-Encrypted: i=1; AFNElJ985dcnobg954pcTILAdqygLlc3zlNNiDfFazFRiYSyuCv4TA6AXS6FpZe/cyE9h1c0mGhOtKXXukph@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRfGQ7BTK1CE7pnlZ90bUwninT+Yo5MRVrGaUDiXo4CUXVZC7
	0Bqcu9VYuWQcQ3a4QOtzvG19AeLHYBRc7mvZFu9H22d6ydM/Z5rhA0MbWguy+8zz7PU=
X-Gm-Gg: Acq92OGoWKqsV39rZ1KhoWReCys3vADTKJmkFMP0iDovje8t5GCoTGIigL68cnDzwup
	OgQD7QELmdPXWBvmEYdkxNvvNols7gRKWzta8BOb/SL7r/7RFAVLaoQ/KApHxEFSG80dbCtNg8N
	Tkp9XMmQl6yFckZbXsCxTlpdmed1F+ZZHWDUYaHD8iAMwxGid0Qm2c1/OhmgiMbm9OvLOfnFsUX
	yqeS5ThLitpPiw65oPMYt4zZrUkAW+BADyEoa2cT43ZrIzOlhv/pnoR0PT4n5b+eAi7NEG1u084
	8eetOzT9EB7REdwNMeF/k3k4I/RcdAnBvz3wpyOPRHsOH3exD4G2E4CIrBNJi4bufr7goR/gte5
	uR3gAMyJUR46HH36/Q0xg9PXow4/s+VJSM+E2Xkrz/81eApGhD7FviSJGKQdz8FAQVBPhwAd4w3
	x/P2/mVfHvyKtsijrhbzckPlBbM/b/ruGv0gFi1CVBb1wWzHCeoin+UQ1biDIxzTg3RaGpBKDhQ
	K5zxHA=
X-Received: by 2002:a17:907:6c0f:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-bf3738f1e4amr638949766b.29.1780904035800;
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0522834dbsm815190666b.27.2026.06.08.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:33:55 +0200
Message-Id: <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38068-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CFB9653926

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

forgot this in the previous email, another kodiak=3D=3Dsc7280

Regards
Luca

>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

