Return-Path: <linux-gpio+bounces-31703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CoOOv/ckmlvzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:01:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F4141CB8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89174303A5EC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11094281376;
	Mon, 16 Feb 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK8VBdOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgbtT9ET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3D27FD52
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232328; cv=none; b=Hv+NjBQmGZcY7zYJbU2a2v+CR78kbCZkU7hVwkmK+b2yRfljUrWZVe6qiE8mfF575XGFCGBXfTxiR3YQhF9Q/qAtF7iWeOVcNvmqQxnnYqzC8csmmar+cRLcN209oezn+pfLxzI10Z2WjD56shZGs2PrQYc7RmNvdrknsEyccqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232328; c=relaxed/simple;
	bh=IXpadYwC2wXihg+sOOMq+tSAMI1v6TpBlh8+CsXQv0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9QiRrQnQ9yVpjC/unHosY4i79KPKysbllc4FlAxmM46u2NDJy2teEFw17/L+L+F+pbM4qNtS2GOG40HfQ/x6GF55ZDvoCJ7kn71/tY2DUHVluNrIV0ue/9iOCktogg2oh+bzFsyQkSS6AhZLkH+e+0R5/1WRgk69kG9d+q6cLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK8VBdOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgbtT9ET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8hg7J2805007
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+pqD2uaUU6
	7HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=; b=VK8VBdOfGkX8NgoxWhCY2P+tK+h
	8fVeCht+TA24hKbMGJMuuGW+bjIlVFjgGueKNhcfo/nI/UAMMcqccq05PHRq/1hk
	u/WwJaHk7BfWXW7iBAt0mb/WWY9aDIP7VoOYFArv0S/DZOWMyippKZYpbinlU5EP
	bFuugoNd2uhYlfixAEPj0ePO/DtV9nwSxDCdwMOrA4p5ibwsLi14h8WcSd/fRGV6
	dxbuqi5Rtw0bF/S8ZHROn0WGh8Pcc71chmO1LPVuW8UvZamZEKLfVUicrIqPaZ/K
	8PtnBVeWQoKr8DuQuTmtdXQzHG0QlGtxzXf5UmxvUXVfrhwmICrrwfqIvgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxug18s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 08:58:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3ef536ddso2229852785a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232326; x=1771837126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+pqD2uaUU67HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=;
        b=SgbtT9ETI8WqPQ+U5q5nflur6hZy5hW2wi1c2x8RAmC+aMhKGcTyLO1PCoc4ZsPkM7
         w/5ew0UwjI2SRoBAnlnF8NpDJTeZi3stYSK+Fzhrgv08eDYsSSCNDN04KjeehI85vVaW
         MT8N8VmIb5W56CW7ac7KiSNcZSZELQg6K3+58959ZT46d47Bc1ok8BcKWOvHNIFAAjOA
         kXrRpv9gv++nmsF/KPzerqohMuOI+F7h7gF9T7NZ5a1F19nvr4l7TRlnC01m09WzFjEX
         4LJ/n8XwxoSxtMTU2Um01ksBft4XHBPStt+mrfu4hlEX0BNoKe0k+OK2a+t1/9Z0vq4a
         GWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232326; x=1771837126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+pqD2uaUU67HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=;
        b=nBNBNBXN6B1E5H+o7iISlC3HqXrHub6ksEs2DrswSCb+Als45TB0T+/jyX5SZiL/h2
         ZN0d51ZdDHI+m/PWX7dgDQJEYlQWkb5DV2QuRy+akkIycA5uCumF/2ZIekOq1e0nIRnB
         DT8sDSxhjtJBJRxZaqSa9IW8jZNC9ttOXAUdrQxStMyK65RJF80uNaC4e4XAvbOt8NG6
         BRG8sIds6PHHWZAia7qZodq6d9yPwmFtcKiffHZ+9cVt2g9bIkwVQmJzH67Okybem2Xr
         CuIhIEXB62CEdgMb6uRSePkJeL9cnMmtbfno8+0ETE0zudoe75Gb0DCSWytoHRXQz2nH
         ytfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpi9mLbauMxyDGFY5b48StL807wfFu3DKJnobmxj1QoayHwRKBLk+OGFGimlljniQa5k//q0RAwXk+@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiyx7yjixXxPzCD4STgFNuWNA9BOwmiLRFkXviWwFjTO2T3fO
	psxCXIKI1kig/R88w0+Pi5r1Fxyqwy9gsRYRGuXlOiGFxsBH0/eWX7EtyPLpw75JIhokPU1Yorn
	OVaqnJsBZAce77ViT0FAXJGUpiZDVGAz+yEu8bDaVgA4Ap5r8wxFORE1DPRgQJgdenYkenH4e
X-Gm-Gg: AZuq6aIcXq3YjFQXDJRjRhKJPOJ1HAejbkmWOBZ+Sg6iq1PLf5sGVbpI4hYa+I8hkOM
	Xm6GRanGvZGT7HrW0anEprcXR73KbJzfxbvavpA7Xi1WG2HblGM4Jgqk3xkBFeyGVbaevyOn7ps
	ghXUMrGmlG3+TeZlPo87knnckTxaPkl3IUOXaVCftnLLrKkNotfR93QyhCZ/wLdcJrduZvtSoBY
	ih6wk4qfdcg7d6RF5zyINrPKCRP1yeryEhAAkUxUr/Ml8rtjWZeUZPZgS4c4afOzkEe972j6JUl
	Pq3FbKv9FBJ2Lhm6cEdJoskymfyRqQT/hcV6pvDfV9FjWFnnq1fwLcpQEEaaO+2yZzN2aR5dxte
	XSTL97DlE/pSsu3I5G+bQ/jCErX3uYIzY0SjIkQ==
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr1185377685a.55.1771232326026;
        Mon, 16 Feb 2026 00:58:46 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr1185376385a.55.1771232325645;
        Mon, 16 Feb 2026 00:58:45 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm27012348f8f.16.2026.02.16.00.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
Date: Mon, 16 Feb 2026 09:58:40 +0100
Message-ID: <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IXpadYwC2wXihg+sOOMq+tSAMI1v6TpBlh8+CsXQv0Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktw/B4SJK8pkURks3LgzXeYbXuwPMV90n6pyQ
 GqUjkvfcHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcPwAKCRDBN2bmhouD
 10yJD/4r/Dojzc48CwULWWB5m3R7FNcDE9N5G869tKK+rKRsp15+Q+8bRwoShWOHa4lz4MmPcES
 F7Y1U7QSPHpmxx3W03YqfJQgSqFb8GjKbFPlpTEZkH4tr15bssUSzm/9TrrGTY6JTcynEvpdTJf
 3EhufZPp5+vEobtLBLlza4oIawnGV7klDNJxnpdYmPAUtkmZVqmKmwuiMm0dyFdCgj/YiCoN23X
 3HUCDcl+AsUq8k7JmzSMDYwbIhJzDGCMnQGiAtoCTVgRY9tAuylndex/oMhugdhjMjbDo7W+zoo
 FyTMFDrPSNWct98shU/SNws43qTLKx0zUAcK7eTlYjOMVezuXfPQsGNtJ3PUmVm+kdy1oFcXj2P
 OyIu2RHwVIAkjH3QBlOB6aKUx0Yj/yOHgjqMZee9GSEtjKhBVD9iWymqdNf6PUgr48D6CKakac1
 AmxclDlYucbuX1jrdi43gV5hOjAdzjvoJ1oo5wpJlVDiQZ+HFRAj3RxLhqpvzyLyfoslf+xo6yr
 xGK9aAyn9p/+qqHqDbsAdLtp9YX1KhO8uY9kEWE5HFC4DYq5crwi27YX9UyFWESCnLIbQEO/K8B
 hfckRAS7fSM6CAo4oA9+Dt20qJ12UA7kmoGxe7rDHIGwX2BTvPe+Ip0o3HU6o5xOvUYjuAopDuc N3YvY3dp46qdWvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lhI2rsLEZtZFWsTWcwSfSElE4-GIt41p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX4c8ZI2H3Qwn/
 3/X4koTvFFw53bvv9Lq7Gs4HHQtoWweBZkb1F06XEIs6O7MjHtuRlgMY20f36MIL97FZgbNshdW
 cGtpp9UAHTGfJgaAeujmb6fK6quLT1KLSE4eaKW34S+xGW25wXnnOQj3o60DqFXbRXIJ3ALSTfF
 iNOCr9l7gUU8Pn2FXuz7ZqTgCo6UDnEVwHcO/cDVIk0Gr38WClDII7KaMoYJ89hrzJiUbiJaq3H
 QE/dmuvUxWKcKm0gwLN9qzhjPjq+BVC2guF/zhpU9d8CjNH6XMVABG2LL6VYZR/uETTuOct9cB8
 BJ8+IU2t7VEfRJD5i+mNlg4CZc0BlD9scXdUGVury+Qr5A5d7i6cyY2s6LOdWddzu4NBV5qgrje
 MZGiiNXxQvsvMROxpCn49N1ETbY/jZPo8CBoezkVgbUKZXG9p08ibbAaSfzMsEaEyuK6TPl9/U3
 LeHQLMm90NHXYZVqFfQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992dc46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=JabwrOi8oxoqBFYtomwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lhI2rsLEZtZFWsTWcwSfSElE4-GIt41p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31703-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B6F4141CB8
X-Rspamd-Action: no action

File-scope 'sky1_pinctrl_pm_ops' is not used outside of this unit (and
it should not be!), so unexport it and make it static to silence sparse
warning:

  pinctrl-sky1.c:525:25: warning: symbol 'sky1_pinctrl_pm_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/cix/pinctrl-sky1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cix/pinctrl-sky1.c b/drivers/pinctrl/cix/pinctrl-sky1.c
index 5d0d8be815b2..938894058d86 100644
--- a/drivers/pinctrl/cix/pinctrl-sky1.c
+++ b/drivers/pinctrl/cix/pinctrl-sky1.c
@@ -522,11 +522,10 @@ static int __maybe_unused sky1_pinctrl_resume(struct device *dev)
 	return pinctrl_force_default(spctl->pctl);
 }
 
-const struct dev_pm_ops sky1_pinctrl_pm_ops = {
+static const struct dev_pm_ops sky1_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(sky1_pinctrl_suspend,
 					sky1_pinctrl_resume)
 };
-EXPORT_SYMBOL_GPL(sky1_pinctrl_pm_ops);
 
 static int sky1_pinctrl_probe(struct platform_device *pdev)
 {
-- 
2.51.0


