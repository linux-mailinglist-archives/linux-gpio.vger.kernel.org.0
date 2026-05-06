Return-Path: <linux-gpio+bounces-36268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHISLzID+2kbVQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:00:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298C4D83BF
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 11:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 837363008E1C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27313E0C40;
	Wed,  6 May 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt7FxsSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g61UVNp0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350103DBD7E
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058020; cv=none; b=bfZSdcz4v4rRFSI3Urj8r0M/bhz2COSw7Yu1MPIsLcbDe4TRASnR11jyuH52Gou3FsWhuGjImjsaBkK88Eu8deq8xzRPA3puARONpytRb5OPODIRj5HNi1PLKFbCX9PBXFIzwfErOITWjol9tm9FQicqABGwUVvbRKx8sUXJjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058020; c=relaxed/simple;
	bh=xmdz3wYny25bQ8pJaqI66NFrQHZv/ik/IfwMuKW2aUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kov6rpsTrzBmFx6T6O3QnrEQorI4vzTOt2kVHPpjZfu9TxxKgG9UWeL6y4rzMp4jROf74tO6ZAtC1+mhmS1ZnYDQG1qbhmqEHOenok+uhtfe/eRDh516Gp32z1FXjaf5cXGLwc1LbM5w+B81pzAQlnc1ify+hAWo8M5XmyZQV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt7FxsSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g61UVNp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466DbMt911955
	for <linux-gpio@vger.kernel.org>; Wed, 6 May 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKn
	hoKhaiig=; b=Zt7FxsSUdJgjc6dcEgGSzNkPLnUIBfu1Mh0ZiupvlrWIvG8J8NH
	YFHDT56xJnc+yH5W1tCAqTzKNE9uPYSAAHDP8ZXY0ar7utWWTctL8Ez1u9l7869K
	jwhvtBI9eJKLmf8mDNxIhR5vydH2hU0sgmgCIEF72Nx37OSq9s/MzFe2Cf4Hc+lX
	57mXvYAbgYMUrsjb5Ru0tiePu8EOPMLULx9m/ZFeWxqkiN8R5v5ceRE5kQ2Eewoy
	aw1dtrZgjmq3xrBn9GUOJ09B+XnQ1UgS4pkl5G5UNb5C4QQAIhjG1XaA3ECELw2e
	Uexj12E2WoQQqhFL+tlv8RoK5QQRWCWp/aA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jkwgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 09:00:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso111277671cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058017; x=1778662817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKnhoKhaiig=;
        b=g61UVNp0MquR6qf/vm6smNuwMgGWBEtkJxBH3TVcQaz6aNbwOEusNvq1m6JnFppHPI
         Bpl+Q/+/pnOkoMKlELT6jxS5NWQ0GsR1XrxIQgEY6QDAW3i6Ik6OZjmyTx0561c4uspY
         vFtrXd8RF9lLrC1f5RXJ2PxRF6MH0UmcTW32y3s3elDbTF5pK7XJ1tc3XfEUHtdS1WqJ
         ZheMRE0rfXqKxX1df/w6vN6ERJo2pA4D6bTmfAtWzI2Gnlww3Q8G3rFtnj254UEB/xyq
         1k345DqRLC4yG0YesmI3u+r8lZ4qJZxG4iHSCs27sykl2gdrMBS2VRP3KEZFxJHrKDCh
         oJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058017; x=1778662817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgD8iPcNnp+ceVCeWbCaeZ6AScKdSFlYVKnhoKhaiig=;
        b=azuTsX80gC6MwXNUqa+G/cMHIJF0+Xs6M2gxrCP8deGDShatBg0IZpfylAolthwQer
         s3+JyACXtpEd18N3zNbrxo3wG4om/+YuZ19rgxkwxRBDYUMR4HaozwehWUMHpb/1fzkr
         XJ7qRHQbmR3g0kMhjEl8uYff6VxOtS4/NGO9nqWGk+DExfUA1oOMTvxgHsUXJKujR62D
         kM0eUxhOzNBA+7RxpcLnBoS0izp2zTRCUzOHYt/zTmG/l/LU8ATP4bD/MPmDMge+PaF/
         5sULv1AWV6Ez5RGzNJJ0a8JthIXVwGcwWoySPcV2xVc7KE8XK6b8rDPYfK3Jrd6Af/cy
         +VSg==
X-Forwarded-Encrypted: i=1; AFNElJ94kVP8ckAqtWzM5fbtseCHGTu/YXQvFNeTOsR2etxEma7HMkQJV0ns3rjJj0MoT4Hu/Sk1Pg54I5F9@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBWZi/UGYUegxojThzwB/XNmt22g8QhTzZunNE1Co4OAYmoVE
	YmqOHF20yBDXLGMjOSK9Jr16n8p2f6Vm/3MLEUq1rh3BYZwVCD2TXzbMNJzL3pOoGncxVqsBToN
	/ByHFGFhoM7nNlwJL3LhRK3FflmePCJ9x5Ap0w/7cfLopSEzkQdBhIGfWNshaOw5l
X-Gm-Gg: AeBDiesRfU+fwXK2o356Xne5/r8E3XyyekqR76wn3swEX9bJZvkmANtvCGNBhlvAT+F
	JmvavdhfrdO6W8aOZYYf//hqrMr8VPl0nnklMLdSVzn6HxnB+sYib/+cvkWZuR1S4X7RzGKVid3
	eszevA4DWPmGRCr2t07G8YYBu6bhP5iPdjzXfHhZ1PrIW4/y54KUQ891kf/+XmBzukccnAM8NU4
	b3CWOCfnjJuE25/9vtD/IsPADONibimKlxmQ3yaq3k/fKth4MitQSvAtTY7QuiIf5RBjNuyWWV3
	k78AbpA55XGO6R84juftcyJyVn9cTadQ4ek2iteWrpNzrY8wGKqM6uWqep40PTa+sjd72YvBjcZ
	66mYMgdFqKyXj5O7Wck36/ugVWi7jxYWH/HmqHOCrKYIihLQDE0aDkL9HsYLe
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr33664311cf.44.1778058016790;
        Wed, 06 May 2026 02:00:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr33663211cf.44.1778058016075;
        Wed, 06 May 2026 02:00:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e539109b7sm29277525e9.15.2026.05.06.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:00:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: qcom: nord: remove duplicated pin function
Date: Wed,  6 May 2026 11:00:06 +0200
Message-ID: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NyBTYWx0ZWRfXzrMBk0ax3zgR
 Tm9LPbEZoie9ELUpax+S6DKVZEQdlGEm8SXDbOTydPAtVBHz3B9wmksHpv9R3hEfAwRD94tysOT
 Ovy8P2FZEGgzrF86olPWiCmFnBrTBWp4D97e14UwNQOeaCji7JGJUB9kjP4SRbuqDgGh6fGPnoC
 hC0uA3Fkf2P86gJkUd03A3YiATxxu8bk31SoAtVI95uS4aVWE1F2FG9CaLy3/CYhi/0er/ltJ/6
 fXz9cOkMlLXPy6orDiVG0ndmNUql8TCJn7NJe8h+LcZHOfb+2CXn4tmqJbu4cMamIsCJQI71MeE
 rOqX1RLJf0VYVVbIxpWOkm1bPHpgSVbZ9vbihCEkhqqEelqIuLHCmaUrfZ7BvHwS0goJMynYckf
 Ts4rCx7UDM8uOpC8bCOIMWUUJMG2OqLNHhCiEYHV0sb+Ymobe1J2B5qu7a/DubxilFBygH9o4d+
 8Wa4VVDfvqzFe+pft5g==
X-Proofpoint-GUID: zQ7WwQqm5OROiPiHDDR5aphRd49pkP54
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fb0322 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=qCAjmkS9BwcdIvOu7YsA:9 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zQ7WwQqm5OROiPiHDDR5aphRd49pkP54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060087
X-Rspamd-Queue-Id: 2298C4D83BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36268-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,intel.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The qdss_cti function is initialized twice in the nord_functions array.
Remove the duplicate entry.

Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605061633.BJLI5voT-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-nord.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index f14361101bf4..7c21306e77ff 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -1417,7 +1417,6 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(prng_rosc0),
 	MSM_PIN_FUNCTION(prng_rosc1),
 	MSM_PIN_FUNCTION(pwrbrk_i_n),
-	MSM_PIN_FUNCTION(qdss_cti),
 	MSM_PIN_FUNCTION(qdss),
 	MSM_PIN_FUNCTION(qdss_cti),
 	MSM_PIN_FUNCTION(qspi),
-- 
2.47.3


