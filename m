Return-Path: <linux-gpio+bounces-35048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IDwIr872mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 042543DFD11
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C41E030EF38B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E473603FE;
	Sat, 11 Apr 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs9pX17r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V47bSwwl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4C35C19C
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909491; cv=none; b=tRHI3ETcKUSIv+VvfI/PotBIKJpDTZpm3jua8COPIBzuXYndygD7S2FF6iGehRbPtDxhrKr4UAAn8JPslWZyFGEcYNMVVWGLJXZEtKEqNxN+OHk/4T/h4Qhz701NxL7GGiQMTRxXEjP/vlRmt2AC/r/bcq11tAcRaeuzMEVoQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909491; c=relaxed/simple;
	bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT3H+lxFI4NVYTypyRVbQ8N94uSCmWDeBH6K8SOhpRxkvww/yP0PToTnfGRd4LcHajkLGVJFIHh1SigJj3oBPRhO5JUqctyGfRIvLvFuuFKLMmiPT2x5kOp7Qi2/JllqWgYrsKjowZjFVAHaN10zod3ub9e0kXny2lBtTEtU15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs9pX17r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V47bSwwl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43QrH621302
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=; b=Vs9pX17rEvZCJU/5
	oR/lUvbWwG3vzUYIVLFj4RIdRazZfdYBaVQCmITh9XgDOzbRzUVvuZtrB8jtqYcy
	0CzUo0fACwCigiJSH5UqZ6nnHsWtWlAxNS8/97UN+cDidJ2ljJYwEHa3ZSYKKM+n
	1sztsrYOYEKK4en7P0t1ZMwsPyxL4j6bZXnl1dP4BIyhQRgwFSwZs1PrxAP22BUM
	+b9clcSAIU7kwKsoOrgok1WUFABxGlI0l8Jf9p/p7YxwntQT9DRbYCxRsjtgOY4U
	IblltI34k5Sk3XRnPSxYYY2cINCTVwaAj0SsUIdxA1xLtR4qurOAgiGKiZxZcNHv
	X9bOPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrncp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso77812701cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909488; x=1776514288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=V47bSwwlmal/1g+ndili7Z0kaSKMLbMxtnU/Rb4Csz/823/zCY27gh8uNc46haMK/p
         t47IxFqS7b44XauA0E/2DXh9+CpKZf4mWk5m1roDU4kGj/OFYGZnlVsxunhpoXjBOt5w
         +mwHkTknoYBjbmORSRXOmpsRIo5++IiOVKeUfqTIYSID24mh9Gi1H4h+eAWy4iJCQuLr
         vyk9auU8hzv/MwBJIn4iVdwCyJoWyw/8EomH/cDeJLhOI2Aw54moZu8iv77rCeI/XaNS
         VAnl+QMtTk9QI6fcj5PcUBgcMrOIqXj1N13WAjul033FRGRyVtXcSIcByN+JHx7rjSUb
         QPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909488; x=1776514288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=A3jhcJ/QAQ+tQgz9hltoc1UV8qeyFl2nLNb76cBLfgRoNgTIR0C5QDcAoOUwCzNJto
         K1dfp2nkz72nSLiXP/Us/1HG3i5guilCl7wL462L/Torgtt/8GJ5hC07mA5bb1/gKf8j
         ZC2sysQJPp8sUA4BSqdN/jHvAlrWe00pWRyTozLHA8fcjTVPIThjSL6jKX51z3W+MQNX
         0kK3axY9x2dv+Voae5W+Soo+i2hIjatjDXmi1XwrRwKDai9vVTLyCnCtCYddR156PyEj
         3afpcQkSLHfLKy/Y4VFzo6KKp4qPAexIOLIC01f1f8LAkAWSB1Qbxs/qkdu895KRI9/i
         t3NA==
X-Forwarded-Encrypted: i=1; AJvYcCUseueBV8WT7o2au8ehQdlqQ2KqpKoyhGrGi1OzCgbtdoOBPA2ngVm+3OoM0Wcnpug6ZNLydiyBoUiY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9M4Jtuq0FC80lz3ufspzBEhUkjiLCwqFJYj/qwU0H8KtS4GR
	0efmRktg2GTcQkkqmHscRZGWlxCKQVamzdiGyCDdZMwREWrlb5pwz2Q02SMq0c6lyr5xN8MJtxU
	I8uawueDprW54JjN8fPLpHRn2GJr8Ii/s6gflolj8Uox47hRkLTGLHblnrS1UIfWk
X-Gm-Gg: AeBDiesTkVG3HL2QrRcMIOwvv8KVQ9cHePBKcXRXp2UchxMEAiMHTSfKc0ToDnLt4hL
	GO5zBreXsZPbEQfIvdf+sUWiBJeT1HqhrZ8/LIVDnurUMMOc8tazoGl83O2TJtZAVCfUIZfBCON
	oM5Q7P26DyeGKO2uYNS7MhDg/MokIY0V556xAkncjv/SS0Ei9tqxrrqV93Pl6JXZvkJF5KanfET
	FblNrvg/kesBYfCBNi1Ki38i3nsgQwXw+4hBbBxxRIbPKILYygjdGBF664WuSK3vmKWVu32bF7n
	a7C6vThWYQwkChgJa2X9vykR1iKuZSmm8U9tHwOMoDmlPWLTgas1L5PpJao2TihS7bO4ogu21zc
	ILs0yn6fL7iF3GGxzTFTQgiQ+pWClKOIm30WAP0gmRlUouAPpGZao9eGlngOA7IRt5sgTixOQNQ
	uxmfUhgLbcpq+iLsSr7cpBMc32N2cwDawVDj8=
X-Received: by 2002:a05:622a:a548:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50dd5b7c79fmr77592711cf.31.1775909487819;
        Sat, 11 Apr 2026 05:11:27 -0700 (PDT)
X-Received: by 2002:a05:622a:a548:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50dd5b7c79fmr77592201cf.31.1775909487381;
        Sat, 11 Apr 2026 05:11:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:38 +0300
Subject: [PATCH v2 18/21] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-18-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpHm6fYy9faeKzAMPgr6LGW7nVgHcX8hKrg+
 qopFVe49u6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RwAKCRCLPIo+Aiko
 1RooCACTizZflR7WKB6rcWXc9mVqam8f3y7ZEymyQjkmYT0Fq5EoVed/5U/A/eHZbscogqTiZHo
 31eHxncXOZIKlam+Rv8DV3lvfmC1W0NvHM+NKkJrxtKTV/MF8b0eO2A1uHFp1ys+EDjst6dPB6R
 Ny1kZAL7tOKNTUiHzdl2K954tffQj8KMkM02GaQSYuZ+RKoakeIaPDDg3cOh5gJxi4HdQos4Dtt
 SMUa0tZ7SBIcvkji9Xckd8bWlaMtm1YQE06k7qPvyWJGsK3i/0wBY+Z57Yz9bjKZfXh/hVdUGM0
 iY1IpWo+PdeQ+t27iZqaqWDgaDYRSZKqbP0s9N/dvJIgjK4K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1xBX3LKXAku6MaVEHSKK-vGx1gi2R9tD
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da3a70 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VYOP6asi5FRKG1UsDooA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 1xBX3LKXAku6MaVEHSKK-vGx1gi2R9tD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXxUAlRzauXdgx
 fbHWcdz5knf1nVrmI+3wPMXh4C52qJcb1oegp8rzWfUek4cgxHzmRL6Ty/hnhghkbrsbg1PsjeJ
 ZI7LNeBnt0DTtVgVp8/Go7mcCv7ARJ95dKAAM9sQVQb50JW0albJcTasDAZdRug42AJd56/MIfr
 0whuXIbnrvhAOTZfOebp2Xi58in0xLr19qODeh+69qJiQbbqbzloEqe4D2slaUNST1lsiH3vL56
 cVi1baD1JbIyt3wfn7KufRXWkgv0VdRlXCQYCr7kvIGMrdi5vTGB2BeYoebigx4PY6jz5adhFC4
 IYVW9ngwxT0YK5qE1abJsKpMLq2qWPZieNWUh7/0KVvr4KbpX3gB2TgsKSv1Dcr9JkmlLZqvCyt
 DO3Amjdz6vViJ/s/B/oPvE7fUVL1gAsiWq41VBNDtDO3l/k/O7qsXywVlUjvxW9jWkK4olttxS4
 GlzbxcCCOjl3a9tpVmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35048-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 042543DFD11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
It's not uncommon for the panel drivers to use devres functions for most
of the resources. Provide corresponding replacement for drm_panel_add().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 23 +++++++++++++++++++++++
 include/drm/drm_panel.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index d1e6598ea3bc..a6029b699b73 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -101,6 +101,29 @@ void drm_panel_remove(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
+static void drm_panel_add_release(void *data)
+{
+	drm_panel_remove(data);
+}
+
+/**
+ * devm_drm_panel_add - add a panel to the global registry using devres
+ * @panel: panel to add
+ *
+ * Add a panel to the global registry so that it can be looked
+ * up by display drivers. The panel to be added must have been
+ * allocated by devm_drm_panel_alloc(). Unlike drm_panel_add() with this
+ * function there is no need to call drm_panel_remove(), it will be called
+ * automatically.
+ */
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel)
+{
+	drm_panel_add(panel);
+
+	return devm_add_action_or_reset(dev, drm_panel_add_release, panel);
+}
+EXPORT_SYMBOL(devm_drm_panel_add);
+
 /**
  * drm_panel_prepare - power on a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 2407bfa60236..1fb9148dd095 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -329,6 +329,7 @@ void drm_panel_put(struct drm_panel *panel);
 
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel);
 
 void drm_panel_prepare(struct drm_panel *panel);
 void drm_panel_unprepare(struct drm_panel *panel);

-- 
2.47.3


