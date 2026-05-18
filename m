Return-Path: <linux-gpio+bounces-37043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM8WKp3hCmrU8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:53:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904156A1C3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 267863005AE8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965BD3246EF;
	Mon, 18 May 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb2rYQWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEGEhdqg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5831AAA3
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098011; cv=none; b=mcyCznztPeNeIRbXQS4R+cTS9YoJSvE0ZGn3YS/4r6IVnnCVqPm6zhjKRYa1XNUv2Dk3ycsAALk+AN3WvDjv39xxY6bPUT8PkBJ+wqzP2SLxfRzWqDY5DmJ1NUUlXd9UwJz6kPtj0NWTspJWZr23Z6nf9dz5QhU6lrfnikFqnNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098011; c=relaxed/simple;
	bh=JRFp3ZyRsS9BdVO9jijuB6YidY6prFUPISVhTTV8Lm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HoUI18Sfr3ya12AhLO+0A3rSO7BwOtOghAw2jHPHNEChjzJekal8gNPJLwhDFpJvM4m9fd82s9tTmpKE58luTfQGXdywgfPIgf2YorNhNXb33SB6OyALgqQTioETQ2Hk8LNZJcvN8oM0B/zS2mMmxK1HRlN5vBVUzttthikPsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb2rYQWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEGEhdqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bIxa1696626
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+W9KxY21Crql/mWM8BRzYQ
	xGEN08v9X95i8Y6srJb2k=; b=gb2rYQWBZxohgy/LcjGrI9/HRMs3ABIOxxzQfJ
	o/VuaNtff+nLTtcAPzz7q1yHiSJJkj8cQeW3LQDQCUQ6f+FYjUuC+H/jmymDq5m8
	MTR6VSA/mhOGh5oqroNkBlWcwml61dn9NJnoWgp+dPeNRvnKzTPAzjIdh5LG768g
	hbVrPVxzBKfEmsO5F2R20a8xhTE3yR9lUXaIwU+UevlvUz88/cgeMyov5BA52OLw
	dW91oHgfTaQvXw+7ekj0UW3CtyqaBIvO+t6TWVtAZM5bkbgysl/1GOa8BThfu6DB
	uMJ4/QlMCNchh+xiMywmxSKVfaAz8E2UrivVFc5o9QQSN8LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk13n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:53:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso71057441cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779098008; x=1779702808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+W9KxY21Crql/mWM8BRzYQxGEN08v9X95i8Y6srJb2k=;
        b=QEGEhdqgbc8r5UDwuWfIMLbuWG+fzOaG5VL6UCATMGcTEwQrxJ4lY1ab+Rff1V58yT
         9VoZg4h/jPwVruc6v0dhvxorxkPoPtG2Fpsol0SOiGbMjUmW3RdEY2PtWHnWi46nfDXo
         jVxqmqUlYVd+w7G1q7bl9maU3efW8kbr9rSe8JE7SX2u5iVRI+5lN3yJHYRUwAyYU7mV
         4KcTi6WPmk2ZevcmFWBsOjSXp92ifeH2njXZhKHCzA/xlXJAfaaJShEMjfyLNrI3iHCO
         eZfc9clL2Un1L41Pasb6Ct0eLx6OGS0mzaTViVx6FBq28JfowW7OpGUVf8eAWvCF0sBm
         NXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098008; x=1779702808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W9KxY21Crql/mWM8BRzYQxGEN08v9X95i8Y6srJb2k=;
        b=YQ8BjWliLxqzCiD3CWAa1h/N9JlDZX58KOoJRMwHaKQmefTkTTa5XzIXLGP3Po0SPT
         eEcF2XuL+9nYREJxrKqsuURQdXoM3UxyzD0/W3FmXZpiHuBOA+iLHjRpi3FWz69JjyaQ
         FSz+PebfClfXk69KawFUzuyOsioDhJIBDAHTqtrhFhxRw7T0+5jxU5tMSjWouD4Jbd03
         wCfu/tjlutlWvu5u5LQ1iMHd+W+tOriUi7RTBcjTLrWRXXWSGUlaC73ypBFj/jQOep9y
         qYt2SzoX3u7UfWGTUiFBKEkUVOjMvKEHCNOCGUkjGTejsWf9NGKUkomf6KGWBIPcalZt
         1I4A==
X-Gm-Message-State: AOJu0YyAFY76w1MYtNQ1aAK7Uh701KiyTFM5PQvMal/yzcmI2A1SN94S
	d+hyPy1ws7IREbw1Eld+QjgNoVp3V7ITawzk85I1srrZv7g3JsL4jmGzx8d/2h9Vg6aBvjhBBP9
	/uQXNozVmFwxYcsFaliPSk116++YQO/veMQAa+MXovxbDRVS2wS683QJYIEPK6CnWYKQ3bVNy
X-Gm-Gg: Acq92OGTBokY6AIDbQ+bEtIQdIdoLNp2I+Q6HFzp4b/Ooue+u/DnneSI1tIlU0C4Lit
	L2VEIxNxDEWtMKUaF+8h4+JDhzr4OWeYJZ2Ecb2OA6x8DgsYi6m0kO371uDkhVPbhci+HhyRqpJ
	qGy4flctjCNvo2FpQHPwsboIR2ACYxx56Nwa9KdByUwBLW516QtwS1gIQaw1fhWRtQRubhMvzYv
	cExoTo/cub6Ggh9pLvapJHrCKRJ+L1Gw7TUkAFvRCP6HCwFGxeSPKxMfzeVq0zGz/RbMQFsM2QQ
	RvCzgYy6n0tTzW0LZO06YpWWMh6oA3TuUcKoYVDUd1gVeJse0+7nEFMw2xZ4P05UhSm/qoPq9qu
	fjWgyEQ5+uRYoD38Ma0JXQtcfcx6hl3yOo7aR9pg8FyoHfK0thg==
X-Received: by 2002:ac8:7f8a:0:b0:50d:9174:cf33 with SMTP id d75a77b69052e-5165a04a16dmr203910331cf.16.1779098008400;
        Mon, 18 May 2026 02:53:28 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:50d:9174:cf33 with SMTP id d75a77b69052e-5165a04a16dmr203910091cf.16.1779098007929;
        Mon, 18 May 2026 02:53:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm35199301f8f.9.2026.05.18.02.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:53:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] gpio: lock device when calling device_is_bound()
Date: Mon, 18 May 2026 11:53:16 +0200
Message-Id: <20260518-gpio-dev-lock-v1-0-cc4736f3ff0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzhCmoC/x3MQQqAIBBA0avIrBtQY0q6SrSImmooVBQiCO+et
 HyL/1/InIQzDOqFxLdkCb7CNAqWY/Y7o6zVYLXtNBmHe5SAK994heVEZ3tLLZOjlqA2MfEmz/8
 bp1I+UPnCD18AAAA=
X-Change-ID: 20260518-gpio-dev-lock-827253e58535
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JRFp3ZyRsS9BdVO9jijuB6YidY6prFUPISVhTTV8Lm8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCuGOVNYhHWtMrmZihtW1niBNmySNgrzj0j0yg
 7FI3BalPvKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrhjgAKCRAFnS7L/zaE
 w3OVD/9+pZgIm6WaYqVfHJC3c//xxjp+O5BHHya0siqRvEiIs1G7F/zlFMCo4UoEQLwHj9RepCA
 qTRpRVbxJFTpzZofndM2I49KuECScrSzizLFZwLS5b/KimKAavBEoqafFL/B8h8BLqPDhqsXlFE
 HTAiI3S0Cc7+g8wy5X70Gh46tbGCJ3pPS3uKN7S0U9CuiM0fQ2BUNz6RHi1s6z/bP/0hJXQFZRS
 JuXF3sMGipSgsQCoBBpGU00qpNFOqxhCGsnFZPzEdehfi5GfZzRbYws0BPJ5Ri+m/whIgAUBbr3
 KEufx6by97FfY6cXvCjU/EEfTYYj8bRAUiXEGMl8aJcffBj/zjrjL0oWiN7l7dD1zytg12Leqzm
 dI82OLjg7BQ1tZ6Fd5zhAJ26hRMjFNt4gevMxtaQ3/is9geARTMLB9p868LYx+T8+BBgZGnf6ex
 NI2kc24+/6A14e25upYE3FMMfztHj+ublsxtaDQqZyXWY2QMLshfaxhFkvpCNWTMmcHHNxx4QoO
 QY6lt7Bf0f+YidIXqdbLbp8csamB/mL8UqbNdfUN7Dy+MSplphcXbnCQWFLLphGftSmyNsGYoLq
 BaVhn0U7E9776xPM7xNm4IHgNom4yVbvAF946OKW7WuWQRCGGAd9h+DiZk7G5TctLfu+KsLJhDz
 ILXoXDWoIsx4QVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfX9aWrusOu+EIF
 sSLH0emYJBSfR+xc7Kzsly6XlnNgHtBHIK3ndNaCSsOte6k+m1pkA2YOfhrr+fDoguk0TZVib/m
 LhcWtjj9kEyxb9xcySlRq+82EfXbHB03rSGvrUajmzR1nd0aCC5o0tmpj5apr8yQbPtSNy9hTCu
 UDa6OXlF+Y87ViFq3QQ+5pEBNLsC6I2Qnl5zvB4pCAk2GZaQIpcntj91CdL9duFhIJyPdt7MQCH
 PcGPAPDCIfJgTWWfeb+wWcA6NSkqwiAyhvJBBy3kuuTNP9wwdkAMCAx/NZerfo0YRzrNBPZiiKS
 5VSd4eP0U85igu9xJFrOA1Mj6SHlY+PGb2E2ARVYvm4ijMJqTgcIUhEWbsXDenDGeTCq8sGxBI4
 6fQJwkitJW71np6L23GtG/RzXkEW4dBw/MO2Grvl6O1fvmAsu4+CgJpohS9rCfZH++fbfbgIrZ3
 aXtBSihupodRuG19wSA==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0ae199 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2JntzmVzRHTdE25HVRcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: m7q-Vqg3sgL0KtMl-Lj__mcwbc12YlWt
X-Proofpoint-ORIG-GUID: m7q-Vqg3sgL0KtMl-Lj__mcwbc12YlWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180095
X-Rspamd-Queue-Id: 2904156A1C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37043-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The kerneldoc for device_is_bound() says it must be called with the
device lock taken. Add missing synchronization to GPIO modules using it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      gpio: sim: lock device when calling device_is_bound()
      gpio: aggregator: lock device when calling device_is_bound()
      gpio: virtuser: lock device when calling device_is_bound()

 drivers/gpio/gpio-aggregator.c |  9 ++++++---
 drivers/gpio/gpio-sim.c        | 11 +++++++----
 drivers/gpio/gpio-virtuser.c   |  9 ++++++---
 3 files changed, 19 insertions(+), 10 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260518-gpio-dev-lock-827253e58535

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


