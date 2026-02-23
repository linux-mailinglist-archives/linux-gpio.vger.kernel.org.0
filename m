Return-Path: <linux-gpio+bounces-32019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJQ1OjQhnGkZ/wMAu9opvQ
	(envelope-from <linux-gpio+bounces-32019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:43:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A817416F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E61430774D4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB9634F48F;
	Mon, 23 Feb 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2sMFQtC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288DB137750
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839554; cv=none; b=AeW927zukn/EfPtrr26FLxEa5KP7vAJFtUckSrIfSBNsNqZiSZHIU0mwNjIkOVWjDdT3VE4ukNe9jstSSSd0tTYMl/dxzPPV4iynl44wnkmwRhzVxn48SNI/mYU/VskMVnZegCMfnk+EvyS4nk8FOQWJ9npIOoyo+89g35xndyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839554; c=relaxed/simple;
	bh=22g9IHd8MbqNZ/zr12muTqPn97dN/XGlfHhk6i+rqUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FS1HbDUmBQqrdAr+1hf83N1lz+i9qzXHd1CEUZQrKj+7Hv/NRMJZGpWBQDmDAJ5mU6mbqFV0DOw8Rt5ElQUTNO3bWWv1wa7KcTxvkhuQsmYhag4gQFosnbzpepIZoGkLIm2MvSJ7t+ExjZnzM7eVV97MwWCdHS1mP2kmH2IFdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2sMFQtC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824af5e5c81so3914644b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771839552; x=1772444352; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYTgRFrukUXwZIV4VFCTpBL82Bk2TIngU/MKatYVmUM=;
        b=d2sMFQtCoQJBomprls4q04xi1xFu1N/o42WIuxHs/LDdjGb7ZtKugSxexogU/iXOK4
         al4l4R0c0S/IjfAqZR7JcpG8l6pFsuqQZbSSRji99eJqNWMvwKdG2XSqvj78I2Li53zU
         1svSpbphEQys+tCQFHQwHOkSgN+wz57pU/5CjYnfacZjRoiOxrbPnBv5cxMdMQfkxhfv
         GBHWVQ9+cttFV515A9ALpo6JxEidYzPuEK//QmyAg/ewuPRExCDerjYIpK0pzBkBjcgs
         /3ekycj52iIUE4Bbki3jRD4uop2XzJhs2QKqC54Eiu/DOpqwxN0gDU+mkFhOCaYT1cA9
         8e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839552; x=1772444352;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYTgRFrukUXwZIV4VFCTpBL82Bk2TIngU/MKatYVmUM=;
        b=j9XdAFhzmEpCIlBoi8UtopvzE6HD2bOYTyOw+VgvmysFGdaPVw9b6Tm2gAX4J3EA+a
         8lzo/23aCEjG/mnE70/VBEYGC8wfxxX7tGWOvWJUS9HWJQ7EnT6rkpAMX10ksG12MkqS
         jrKvzi1r6bVSSeCYpYaV2Hx6sCgNta9J6sKDgobMM9AYUcxB1PNjjuPYziSI733Otu+j
         5ClPDcMG57MCgAT73OGFzvUTbjZ7/hM9R6I6cc0+ZnhdvDtxlNKuxxWppKMJqNfMINHb
         jFpJHdMX70CWzQvq/19SWTR+OgQIRfHrH2wpZXBDDHAEaaS4JzWx9fAzhvpAU0PAydpL
         4p1w==
X-Forwarded-Encrypted: i=1; AJvYcCWqz5WrlQkV1Adw3WhIgfjMNhaYblg274P6FTPTUrivGrnSiTscBPI5dZNuNPW2mGro2ZDX4OSReVR1@vger.kernel.org
X-Gm-Message-State: AOJu0YysN1B6kOtewDRc68Upe8rg/kCT9/L17pwhh1gsbincuHPTZpzR
	qlwsd8JXCsN425GtwBjqTF/tMZrKp+xtWxDy4fRor4NDf9qcyp9OtRcx
X-Gm-Gg: AZuq6aJ7z2avaoca6iALftrxUFmwM0d+Wd+C+4JmOQ3bs9ioxxAorUTAAzWiq9OaUg3
	GqYnqM8dOp0B0meIoo7Q6KiC6inpmT22bg0qwYNXothAr/tysldhYvvaGy9yo7Bi+/6r+rCuYvR
	grEElEQITt2LgBfnxmolhTdYNKATxLsPBML6Sd5dlfhE8YzdVldfkbmpIsPM0KkXPAogBB1NL7Y
	jo01iOcmDbqYyQloTK//O7Vom2ZfS+WhnhxRt8Ei/o+CN3EXcxYJ9iDgRf1iwJR+yfIphY2hHjj
	UJbEA7v0NWEbR8QPoUKN/NfSmE6pmY3Izv9i0KAhYC6SLz0Nl09JNZ+F/DxjJvGyyCb9xc/OylD
	1bAegUUatCbulOQFbq01u9m4h7ffPRajzkgQ6GvCyZhV+tdUs5mumPfcmW7SbUMPUXXJl4QZ8cX
	wOvn9i0zWkLL0tqEOipya1Jn4hmYjM+7w1fGPc0NFPeETPEH6c
X-Received: by 2002:a05:6a00:3a1d:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-826da709249mr7880573b3a.0.1771839552364;
        Mon, 23 Feb 2026 01:39:12 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1cfe:ae34:fdd6:6b97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd694eecsm6778053b3a.25.2026.02.23.01.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:39:12 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Feb 2026 17:39:07 +0800
Subject: [PATCH] pinctrl: cirrus: cs42l43: Fix double-put in
 cs42l43_pin_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
X-B4-Tracking: v=1; b=H4sIADognGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3eRiEyNdQyMTE1MTC1NDsyQDJaDSgqLUtMwKsDHRsbW1ANjgtD5
 WAAAA
X-Change-ID: 20260223-cs42-1244548516b0
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771839549; l=1078;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=22g9IHd8MbqNZ/zr12muTqPn97dN/XGlfHhk6i+rqUE=;
 b=8WHsXEzaVMTmDj2uMjMZGSI4dc9xqerMg6zQzkGPGVvtglNhuH4dsu+uj16RLJn/wMnd2QKZZ
 mR8ljkPzNppBC2sYLuDURUr7AgKoJoUoTAKSnd9lR0Aevtlb1EWhORr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,opensource.cirrus.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32019-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 704A817416F
X-Rspamd-Action: no action

devm_add_action_or_reset() already invokes the action on failure,
so the explicit put causes a double-put.

Fixes: 9b07cdf86a0b ("pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index a8f82104a384..227c37c360e1 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -574,10 +574,9 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 		if (child) {
 			ret = devm_add_action_or_reset(&pdev->dev,
 				cs42l43_fwnode_put, child);
-			if (ret) {
-				fwnode_handle_put(child);
+			if (ret)
 				return ret;
-			}
+
 			if (!child->dev)
 				child->dev = priv->dev;
 			fwnode = child;

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-cs42-1244548516b0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


