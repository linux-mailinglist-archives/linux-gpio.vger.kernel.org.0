Return-Path: <linux-gpio+bounces-36743-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MtiPNjdmBGqXIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36743-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C2532938
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2D69301429D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9293FF8BE;
	Wed, 13 May 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoJrB+ap"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510E3806A7
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673199; cv=none; b=NYpzUS38H5DGyNJrRTqR3Ad7dSGJt/8gZlg8WeS9+8njO0uhmRlWGVewyoaNubDmrCXSeRDop3ePOXxZUdSkv9jYKP3H9NJwGmPBI+aLVvv+NV3XSD/kv4egjZInItZN4yNgVh8tm2tVh6m93NMqDVRNlLNA1KPV5StVMOGYOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673199; c=relaxed/simple;
	bh=+L6F9JpS3jt/WZ1xIf3AfhOznstK33i7Irskgc7mWqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGs61ftYzDPXpPtURoXDt+FjutAlSBaQ85x3WUjAMzRW25dSCDcb+Sio2Fg/kRhKRUPf6RCOcg8xERKJauvPjAKlpmQlepr84+LfgCpe7POySIJeph4S1Eo4C9KnnRmrpFOnccK5VoDVAbkIY8xqCrludj/f2Mb6Tj2PX+DAxBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoJrB+ap; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso58536515e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673197; x=1779277997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aSs6Bhbn5vbObd7D7TaqCbznDacRKBXEFAzEqtAjo4=;
        b=LoJrB+apdTlKzy4bZ2jlSDZqjMNHe/MwBQSz1aT/5kTHzlGc4XjQpEWXQXyg1Er6r1
         5UPz4dhXOdb+UsT9TfqrCTlMU29XIsAloXOX+3bd6ncEju7KKvfWct6gAMunFZXJM/Uq
         aDzdH5Jz/3sa+/QLbbic+EHqB0S/E3sXy/XXWugblpYsrgu8XyJcOOY10Z0lAnGIZrF8
         x9R2KsgQcE6aageXmWW2qm/FgPZsNvmUx31PS/euwcsghb0QFn1mG/+URFn5lrh/TdHB
         /4UKdTqt2SJRdZKLNFyO/egGxI31qYP2sX2ekduADpES7nitVVCxBfnNcOvvDrYoJBD+
         u7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673197; x=1779277997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aSs6Bhbn5vbObd7D7TaqCbznDacRKBXEFAzEqtAjo4=;
        b=RdCE1BCzS9i8ciDhhqnnduFii3s6XiYL3rrkbTr3MkgmMoWj0RH5DIvW7T80kRDrGd
         lA0RKhrQf+7BRAuc45uvUaWM7bJytUPYYjG7dVupTixGh7p5GRAvydECjewowyLdVqFi
         9g9z9bQvpsLBt/0IaDA8FCEz51tgH4IDNdZ3UdI/cbiV4s5d5bbAkN09IzgQOTVCz4V+
         FgrlVrpThTj6X68gnSBQXUae/oM8QPN0+E+hVE8VeiYbVC0vsYeBOCoDhd8jX3TCyPkj
         jIM1lzSLj9HDs+vfLinei3Ik8Nr8RtnTThzWUe8HmhxCF8hNuwhtFhF7A8Mp8dE733DM
         SuGA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zcfs6hXwdhZncxkxGjfuEB7kUPKVP1eOO2SRXqJzzAJEXq9oapfvyr84xzDIXHcKlbrh01GbyDGRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzzn7WSnMV3ZCNAJOXKSjQx03ovA9GQ2oixAWaPEy/dRNCZdHy
	WWxdhQkzXWThFFhP4GWq6zR4EKoqYyHk2hZrFKYGxiB2Q3TCazk5lwlV
X-Gm-Gg: Acq92OEyZFC+7U4Rn1jLwFp+ECQIbxkfAlkzOHblpPdcj5l/n/th4vyQVrI82+RJDHu
	4BmlxJC/PpHU7Yvkx7YFNykWsiME7rL3sYWM+2vuhgUUtVgoRT4FvnBncCNrQIK+5xFGRA0tfPa
	lN52RnaOicyCtgU5O6ADij88i+2yrw/D/HTCPr2Y/da45NrN9NRNCGbYd5ukOeFZX3MEdCbVX0r
	bG3oGIhlsltsmEQab8g+6CcuEh72W03TZkS0+H9MSoBC9xkwHCNKnP4PaBnVYcIVoDrVoo4YmYL
	ptGrRLckRFTfcE5yF6FAlNU0Xa5p7z/chfExIN/EtfylhMOacbey3Smoa6Ey6qEkOGxOSb++Z92
	XWEJknofuNWMhIw9hyw6oJh/Fj5EmQQnjfXQvQZVZ/QnXJyYZxqzcy8/guyBA/aq9CYAi+tYdI/
	t3U9h8qGCz7nNdmXanIUYwp834xDugCHxyx/lSm4dzyuJAtJDb+kUw+hVcUMtLLRnTaQ/UZpoYP
	2K/TX/qNSjXgav0tf6Tip8u2PlUObdYEPM92w==
X-Received: by 2002:a05:600c:3b15:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48fc9a3da4bmr40740895e9.19.1778673196859;
        Wed, 13 May 2026 04:53:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] pinctrl: pinctrl: renesas: rzt2h: Minor cleanups
Date: Wed, 13 May 2026 12:53:10 +0100
Message-ID: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD5C2532938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36743-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series contains two minor cleanups for the RZ/T2H pin controller
driver.

The first patch removes a dead variable left over from development.
The second patch avoids unnecessary register writes in the PFC mode
configuration sequence when the pin is already correctly configured.

Cheers,
Prabhakar

Lad Prabhakar (2):
  pinctrl: renesas: rzt2h: Remove unused variable 'j'
  pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.54.0


