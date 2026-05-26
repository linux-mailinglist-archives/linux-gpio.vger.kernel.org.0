Return-Path: <linux-gpio+bounces-37522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBOGITF8FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:55:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46E5D474E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1E63302FA11
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA3A3DE44C;
	Tue, 26 May 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1rINjwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWkJKKVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4873CA4BF
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792914; cv=none; b=nFn53bxxMq99ExXCXgncaaFrN6+KxRQITmWHI/dGj2qVNfJd9tisVx2Kv2VVZOOKqspPGbal3jmEzEUTUTBxpl49cXqKgIERw6iTOQj7lVQscFDlDNOY7varoHTKVAI9R5ok+hvIQM+9BF83J0OZ8AWpj+2cEw4s4h3bo4cwRpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792914; c=relaxed/simple;
	bh=6TgYj7+dyLuIGqcjmPQ6fsYhukq9jZmJafzRBNpGCqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glTTtOqIzev67LgFA1slxr/U0nV3E4/vLAll3PQOHGC41a5L/lxOGcF0JKDlEsGbq2Z8KC2lVVrbbWTbHNb53kO8EMTXfYytzUMwJd1TvKTxrIFBZyDJWOTuIhdCPD15zYPhyFDmGGhvorOQpSqp0W5fHDgExCedJWNDD5ZCBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1rINjwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWkJKKVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QAHouc005001
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=; b=S1rINjwhqck+W2zb
	t946tF8ADvzN3/JVdjKEKlkPH1Oym7lSb6b8s/LTnMg44FccOYWXS66C2JTDpnug
	FTWnG8rn7Dy/9eGVLpxksncYU6hZ5Uc7C5pDJ5Php03Y9s34YjtgNypGmtm1mXeX
	N7GCDw3CMhOjx33KqY4Oir7jw+v57C0LmMaSIkWgQE0ihBxKpKxRhqC9vw5LHZoP
	g6G+Em7vD2pjXPYxbVvVVvhjh+31daR0h6otEj4DW0c/ztx0gqT5sT/ve4pqbxje
	Ph4GHH03LSauFtZwPUDmPWtCxJzE5ROvb2cIwKxd9txCw5GoNtX7k1HaqrkfLG8x
	H/6bgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm0334y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc6899bfb1so109566455ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792909; x=1780397709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=;
        b=QWkJKKVUbOrBjvAZCV7PhtsxDhfZJ1r4ILGaez0pCjNtwmo4uqtkQNRY94dcB6Z1LC
         ghsbQMdgKuWLN+gaEb9MZKEXJXZIFTyhKvLsPAT2ijnySGu1wSYNn57gRe0SyzXHEA2e
         1En+QAjo0s3eYYBTfZk4E2ebuQBaqpmb9I1SYRKcbt/S4shhikjMexBX53nFMImZKgfK
         COED+XRQ94crpMelsIl7btsnLtZS1RJxZk7AhMGbn07vCxFQvc9lD6H4QtBTRnbZ1jyX
         PYKhIVrkwBTW2Ph/NfP1P7EijIVPU5LBZh7wG5UA8i3QMadp5JR/Te7vow49uIUO4zgq
         vHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792909; x=1780397709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pt0vmTRSBM+lg6Dqvgsk9yG/MKi2Q7e3NXM/rFuGUBA=;
        b=M+Ww6hZZHjsWoJ+QvWcVV7oDo38oHr3gliroL+03YPAIlmmUNqc2UMX0zNGjU8o8Zw
         mQDROpBBZ9cN3v9C4OLC6/iPAg9gIfffALfDLIHu11T94aXVtXyYcuE+vyXgCd6VqOte
         6O+tqy6m/vDCrCcGjfmzZT7l8jpTeB1IIMLczbl1G9+l9JLB0k3KeVxKSyOS98RydUSp
         vh1V9QoF852bZhSPpCZoa7pHsvndrrqgSs4nZBzwA5xU8CME7dPFjbL1cKzzw3nUht2T
         VRkD0gy8vqFJr8iD7LZ7xUMYd2dPow/+HGY9Jn/Z3VMMBjVaO0yzrXPeXY7rBMxLhj4E
         d8ag==
X-Forwarded-Encrypted: i=1; AFNElJ8tnU8DiD7Qd+PhKs9cWqbDR7oPjN2uY9uVn8EQlYInPeeVccdbQTuWU9uBvkbjuuVNzAC3f/wk2QEV@vger.kernel.org
X-Gm-Message-State: AOJu0YyxbTDw/4+RiN283pBNnGMJHBrQVmywO9IptdBBqJn+o9REWJU9
	ZJRHakxr/o5AIw+Cv6oL2lhVUuML7K45bsyijRlOA23VDohBdvoU+t7YcetN/QY2ohteQxNABnP
	Oc89nE2MweplFxMPM4aDUYTEESS09q5wOo30XFMEhVl+8wikjTY7rH2L/76CyUmag
X-Gm-Gg: Acq92OFqD3ozBKoaeikHMO4Lmxquum8Uu9sVe4P6qmAaQC20sgueeH5OQ7pwE0+CEyB
	avgNiV6afSTOT5aeVQ4qgZuqZ4DT1C860Y/aT2L6XI/my9neiAY2VkX/rS8lQcvjtxqqExzEDAg
	ABQyAnaZoWS5QModYHNadPOHUS9wfN8gkj8D3fWQ9NR4vJBR6WQ4IAnw7WuzwPtiQjzQGFzMmIG
	BdJFpbGegDW7LEzJvJa0v9j4vxKn1Ta1+PxIM6Sq39Jr04a2mCrbNJRZs48f32bFhu2YBmOnPHK
	WSvm4JG9l1tTSK/Cg3yYHitKGaIWZtSEQvq3vCAtQdGsCpboQVQYJYH0oonSzbuBca949DVxZKP
	+pSkQa015ciknhmLu2+lIaJZih/IHbYpN/POOLKe/3wA6tb5GXQ==
X-Received: by 2002:a17:903:11c4:b0:2be:260a:592e with SMTP id d9443c01a7336-2beb031b1e9mr185119215ad.1.1779792908856;
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
X-Received: by 2002:a17:903:11c4:b0:2be:260a:592e with SMTP id d9443c01a7336-2beb031b1e9mr185118915ad.1.1779792908325;
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:38 +0530
Subject: [PATCH v2 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=5857;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6TgYj7+dyLuIGqcjmPQ6fsYhukq9jZmJafzRBNpGCqo=;
 b=s76XvN6hm8Y9E8EBxBW3yr15X1UPzOSODhA5c2WN2Of44hD/909hT7VacYqz7DPVY47Vf7q0M
 Q6U8T5c/QmNAGVkUqTPpax/Ctem6l8BHUrN0uUtjFoTTBxXsSRfFCca
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a157c0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Oluqblcdbwt1IXVhtU8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8sUUbs4SeMkXtPpp6nhzvT5YF6CGF8Gf
X-Proofpoint-ORIG-GUID: 8sUUbs4SeMkXtPpp6nhzvT5YF6CGF8Gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX2vFqZFaWPGwX
 sfNDS9AaEkbnvaC5kJFZLAz3NgOKP4/R+pWNqdEd6mGmCEI9hzW0CNZ6h/+t7f47aGi6XLP/m/B
 UwpxmutdNJtD00u+Hp02KyDqYfpLpDDVbEo3Yk7qX4+wd5TIlEjkbyyZTyweIZvuEF1h/yoS9eM
 7GIlZhYHe7uO976EJ5XCv+LTFh+vk1mVy65VlztOozDtQQcQ2yRjnnJH+l5Xct8VBPYM5YG9rFe
 RITf9hOBWr7MlDGbJ5AxURSlgpw0xXbn/oSV5Z8a2zYO9mEwAtgOw66HVv3wFR9V/XK5Nqr/wAw
 bxXmA+Q5QWp/oiuBNPrf26T1fJMzy053x5u2RMxCjYDAQ70p2C2GcH3B/snuUglMpwOnoFxuCAT
 qj5/83lujLLIxtoVd6qTDXFqJPEQUFS2+RcjA9GYsBUqh4XXqmg2FCJOjKh80tZfaFIYcpWdYie
 7a1hI79C9526QY5qHUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37522-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E46E5D474E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are multiple statics used. Move all to struct pdc_desc to better
align with versioning support. Document them.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 68 +++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c5b64649b2a9..8f7802139e4e 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -92,15 +92,30 @@ struct pdc_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @region:         PDC interrupt continuous range
+ * @region_cnt:     Total PDC ranges
+ * @x1e_quirk:      x1e H/W Bug handling
+ * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg:            bit masks within for IRQ_CFG reg
+ * @enable_intr:    pointer to enable function based on PDC version
  */
 struct pdc_desc {
 	void __iomem *base;
 	void __iomem *prev_base;
 	u32 version;
+
+	struct pdc_pin_region *region;
+	int region_cnt;
+
+	bool x1e_quirk;
+
+	raw_spinlock_t lock;
+
 	const struct pdc_regs *regs;
 	const struct pdc_cfg *cfg;
+
+	void (*enable_intr)(int pin_out, bool on);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -138,11 +153,6 @@ struct pdc_pin_region {
 
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
-static DEFINE_RAW_SPINLOCK(pdc_lock);
-static struct pdc_pin_region *pdc_region;
-static int pdc_region_cnt;
-static void (*__pdc_enable_intr)(int pin_out, bool on);
-static bool pdc_x1e_quirk;
 static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -199,7 +209,7 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
-	if (pdc_x1e_quirk)
+	if (pdc->x1e_quirk)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
@@ -221,9 +231,9 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&pdc_lock, flags);
-	__pdc_enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc_lock, flags);
+	raw_spin_lock_irqsave(&pdc->lock, flags);
+	pdc->enable_intr(d->hwirq, on);
+	raw_spin_unlock_irqrestore(&pdc->lock, flags);
 }
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
@@ -348,10 +358,10 @@ static struct pdc_pin_region *get_pin_region(int pin)
 {
 	int i;
 
-	for (i = 0; i < pdc_region_cnt; i++) {
-		if (pin >= pdc_region[i].pin_base &&
-		    pin < pdc_region[i].pin_base + pdc_region[i].cnt)
-			return &pdc_region[i];
+	for (i = 0; i < pdc->region_cnt; i++) {
+		if (pin >= pdc->region[i].pin_base &&
+		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
+			return &pdc->region[i];
 	}
 
 	return NULL;
@@ -413,32 +423,32 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 	if (n <= 0 || n % 3)
 		return -EINVAL;
 
-	pdc_region_cnt = n / 3;
-	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
-	if (!pdc_region) {
-		pdc_region_cnt = 0;
+	pdc->region_cnt = n / 3;
+	pdc->region = kzalloc_objs(*pdc->region, pdc->region_cnt);
+	if (!pdc->region) {
+		pdc->region_cnt = 0;
 		return -ENOMEM;
 	}
 
-	for (n = 0; n < pdc_region_cnt; n++) {
+	for (n = 0; n < pdc->region_cnt; n++) {
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 0,
-						 &pdc_region[n].pin_base);
+						 &pdc->region[n].pin_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 1,
-						 &pdc_region[n].parent_base);
+						 &pdc->region[n].parent_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 2,
-						 &pdc_region[n].cnt);
+						 &pdc->region[n].cnt);
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++)
-			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
+		for (i = 0; i < pdc->region[n].cnt; i++)
+			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
 	}
 
 	return 0;
@@ -477,16 +487,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (pdc->version >= PDC_VERSION_3_2) {
 		pdc->cfg = &pdc_cfg_v3_2;
 		pdc->regs = &pdc_v3_2;
-		__pdc_enable_intr = pdc_enable_intr_cfg;
+		pdc->enable_intr = pdc_enable_intr_cfg;
 	} else if (pdc->version < PDC_VERSION_3_2 &&
 		   pdc->version >= PDC_VERSION_3_0) {
 		pdc->cfg = &pdc_cfg_v3_0;
 		pdc->regs = &pdc_v3_0;
-		__pdc_enable_intr = pdc_enable_intr_bank;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	} else {
 		pdc->cfg = &pdc_cfg_v2_7;
 		pdc->regs = &pdc_v2_7;
-		__pdc_enable_intr = pdc_enable_intr_bank;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
 	/*
@@ -506,7 +516,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 			goto fail;
 		}
 
-		pdc_x1e_quirk = true;
+		pdc->x1e_quirk = true;
 	}
 
 	parent_domain = irq_find_host(parent);
@@ -522,6 +532,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		goto fail;
 	}
 
+	raw_spin_lock_init(&pdc->lock);
+
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
 					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
 					PDC_MAX_IRQS,
@@ -538,7 +550,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	return 0;
 
 fail:
-	kfree(pdc_region);
+	kfree(pdc->region);
 	iounmap(pdc->base);
 	iounmap(pdc->prev_base);
 	kfree(pdc);

-- 
2.43.0


