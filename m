Return-Path: <linux-gpio+bounces-32686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKe7My7jqmkTYAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:22:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC782228C9
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB00E3038735
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 14:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A122F3ACA6F;
	Fri,  6 Mar 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0+OeJHCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD03A6EE4
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806942; cv=none; b=k8EJHj/A2hDEVUlN456N0THv+BwGYYdQTD1FRm+l1GR5CRjC81l+Jmzq80zg/BF4FI6q8xISsZv0BUqzA6B1RJq351io/P2bgkGnOwuB0SYldi/oopAv+aYkGkCIEOGLbvLsBmXeYniNQHKeF1JPdLOjqnaqQWe31u0iqxnBklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806942; c=relaxed/simple;
	bh=arm7JnDlljRb1nmMKO4j6gwgpsWhDrf5OjYQKnPs3n0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H6Hau/+sAb654B+i0/gSvvwUTEHoPr73/hBhMw9VH6rV4svQ8Wreka2WaagfgfeybLofHiaKAp7wAw8fwPqQd8RkE6ry7BFGXPRa7FJDkl5jAXciFsuBmhYgihyMWN+ECyk4aXm5OVclRYkxrOTjS3TKVwIG/SZ2xX2Ww5RTngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0+OeJHCm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6611e4aefdcso4617343a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 06:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806939; x=1773411739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJcxss4DXIYyerBkpQqbK77YeNLvuOHewQEof3j5PJg=;
        b=0+OeJHCmwDw27Jd8El7I45Ks2pJaPr41kBQloTWiVbZHqTZaL0Nhc0E3O4HI7Sht07
         MeNL+nJeqVPW4fiAW8ROeh7BI3ZB7nO35x/xEvO2/EN9Xkjy4F0MyZds/XNbOp9NY1To
         jEDL6sfgyS99PvfECvv0uoMAZxX8HtVL6BVUzqLlXLTfFQFrOsQiNsAaFXs7NXThlcp6
         Xc3Ww2QMgjr994mJOnLJ2WyJ/9K8ShLbkJ+y8pG110hu/o/jd3CxCoxewmYNpB19G5hM
         5Vt75kDuWJhYJRhpdlGt27Y2j3rJDeFXYMc4IcG90lqvcw5+FMwg5laJ5x14z5Go6j7u
         clNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806939; x=1773411739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJcxss4DXIYyerBkpQqbK77YeNLvuOHewQEof3j5PJg=;
        b=MM+/AwxnmJx0flQrdbG8CbT9IXnBFCQC7ACJ+qIIrE2LloyoHiDpjVtEyu30mCHsyp
         DuKZxtJuMNxF0gZ+4S0YgK35X7gps4sGGBUo6EWiXdIAtfwKyMBr6N0Yj0atbjsLEGdZ
         cNU+LB7GN6IMY6cwbrSHyvQ4++rIOHeow6DLUcUu1aTGIrwtYRUa+iMkDdRFuz7KVr9k
         3ZDw24SEspurdjnFRo+rMeVFHmBZkKQoJdSCB2vfh+eLd3UCAdGGVuruo/T6NfRS7lLH
         AF2MIyGnXFQYGjkOyLnd7zKyRXSCTJ8kH+AI6d4Md5z/TJV1KECh+iriyAlfNgN7Zxu8
         yN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuTNgVVGrKt4L1hW58MVrxK1qUs5QX92USak/dYj3INBIzQlgeV5NwPywmFfSPM4H7rzZ83Nc5Mwf4@vger.kernel.org
X-Gm-Message-State: AOJu0YybuHbXWLB5iSwF8qTEl5vvNxP4vKpkCNi3oKiLt82TU52a5U+6
	rlvnbWyU4veJgjsB7sZpS/gl5U6nq1Dmc/22K7L6Lbc4QCGr8CBqYHMYkDdTbKwUJbY=
X-Gm-Gg: ATEYQzyXFBmXo3hMcETcN48Eyqcvi7LHxTZOXoTIqLFaXk37OlrR907EHXC/FoRYIkf
	/SdEcfY+PbKJlsjYuB+K5hJhCEMhjD0IuTCIWzWMz/7ZVQBy/DNNtzgWzsqsT5LyM6XfsVYL+KP
	ND6hTy2WG08r95RgHzwsb1xyHGHNRSnEbbvDXmcpq8Zji/Aj2ZSJj+ftMGJsSZX4vae7WlLmpVD
	CtEbuNjDBcG8GOjxDyrIWulkUVANMxZztSBQXdKT5d3CWqg+luoE2/AxqIlvsDL5vpF4Rk+gTDr
	cBqZBt06/O/mxkDnmeRe2mKPIZUca+ijl5LxHcFnaiaFDV1zxX+YZcYQWNExXVZHc2OdeYQSSrw
	SR8vtI19WGDjc8dpVlZVcDp2nuZZmATmpch1GB/yNPHQBgnqz3+fajzNk0gAqtqVF6csIpq8QKU
	UW8jIPx4abTsSvUmHn5i72NN/iJ8x+d/+0oSOBiCJTnCOxl7v5P2q9QYBwTCMf4mfq232tWRx++
	5z9
X-Received: by 2002:a17:907:72d3:b0:b94:2025:313 with SMTP id a640c23a62f3a-b942dfb4897mr136403966b.32.1772806938645;
        Fri, 06 Mar 2026 06:22:18 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add support for Milos LPASS LPI pinctrl
Date: Fri, 06 Mar 2026 15:22:14 +0100
Message-Id: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf6WZtZO0FQH5FcOirQNOwqO2lZAQ/
 t1GXBiX5yb3nA0iBaYIjdgg0MKR5ymDOglwDzP1hHzPDFrqUp5liSMPc0TPk0thwMEzKnmtLNX
 Xi+kc5J8P1PH6cd7agwM9X1mdjhGsiYRuHkdOjZhoTfjVF/DbbcRftTMxBe+w9wGlLsrCKm1rX
 TWLgnbf3yylH+zNAAAA
X-Change-ID: 20260306-milos-pinctrl-lpi-1097be895afc
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=1441;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=arm7JnDlljRb1nmMKO4j6gwgpsWhDrf5OjYQKnPs3n0=;
 b=B/rj599DN5JQ9pcRwlmOIBEqlKVgqx5oIF/zZahXcU3xXFaHnbRDiKAFtnRRqbdeLP5d8+P0O
 DLuweHEoxxjCYYOVbqMZCAyRKtcar4n+AFQmU/AW6Y5bV66LaE+p9Zw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 6FC782228C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32686-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[144.178.202.138:received,100.90.174.1:received,209.85.208.45:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Add the bindings, driver, arm64 defconfig and dts bits to support the
LPASS LPI pinctrl on the Qualcomm Milos SoC.

The devicetree changes require the addition of GPR in milos.dtsi (as
specified in the b4 deps), the pinctrl changes have no dependency.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
      pinctrl: qcom: Add Milos LPASS LPI TLMM
      arm64: defconfig: Enable Milos LPASS LPI pinctrl driver
      arm64: dts: qcom: milos: Add LPASS LPI pinctrl node

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      | 109 +++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 103 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |  10 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c     | 217 +++++++++++++++++++++
 6 files changed, 441 insertions(+)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-pinctrl-lpi-1097be895afc
prerequisite-change-id: 20260306-milos-fastrpc-gpr-02464b12b827:v1
prerequisite-patch-id: de7e8d4b18a0684e3462fed3f2c82e4bfb7f726b
prerequisite-patch-id: 08e5420023b3400e25c200e4cb39788b53601291
prerequisite-patch-id: 1430b5aa008efe8ed72057da3adc4892d8043918

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


