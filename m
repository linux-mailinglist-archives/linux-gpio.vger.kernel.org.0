Return-Path: <linux-gpio+bounces-34800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGGNOtr91GnOzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFD3AEAA7
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76FE63006000
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9A93B4EAD;
	Tue,  7 Apr 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztm5qC9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHuuANDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DC3B4EB2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566293; cv=none; b=cpoGEm86og7Er8JzU45QI++GjXl0HsXKQiYdfJmDttKbALJNAvGtlzap5Vi8sLiRzf6XSbao/SUEIImoPcofB0aeAeUDtK3P4KMZfwu4mn6/Sy4legbbJ7utfdvrkHC2P8ZpXTi9YX3yZd9bz2IlzP0hpCtjYXEw5EaoPzLh7tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566293; c=relaxed/simple;
	bh=NZsMptbkOwNsKksPpOvizao7mCp+Z1K0TOxxSj4dv7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dhm49fbY8SbTld7wIR2LFzClgffJRqmARmF2UWX6au5VP5Uu4LbGfC1WV6+1duUc+DFX809YSjURcD83cemYL6l2/uzUUEc/aIpUPtGMj9cQyTemYVd1YyTdFpC90wBBPkadnLYSj6dgYz4yxSAXue9VfMIjqZerQR4wPh3kD7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztm5qC9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHuuANDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CaEYx4008692
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCNGtU1Jw1+pZTjJQ+1TxncH3XzMbdLcS6cT8I7ifYI=; b=Ztm5qC9Bi+fhwQrl
	I38zqQpWKR5C1HMz4MSXqA6ozrusGKYpms7HpTFK2uNmoIH/oz2KA0Hvv7o6EP23
	M19hJof4u92/5i5eS4AalnqTPcMdaI80xPf7UxCEzgqbsD663m9CRiDV5dNjDORm
	oUVGwVw2vqt6BdgWs4AXJ1SwjmvqGq5S6yCuRRVQOvvt0T4grt7yIFCuFPETgspv
	e/c7qHufTpTmti2Hl+3VBnNYAvokb/fR29XtkpeDqZX7AaIRMP96EkTDeUsDl3MZ
	GayddwW3v6Im1xcg3YS9EizEAlMCgr1RUIR5Hls6D5gJQywhe3YuQAJ6CMzhg7YX
	tXU+6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktqbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:51:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso81760821cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775566290; x=1776171090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCNGtU1Jw1+pZTjJQ+1TxncH3XzMbdLcS6cT8I7ifYI=;
        b=JHuuANDrU2mJ+CRJXK+vDiQ+z+rWg4l4biu0LYzdoEz2Of3IU8EWNmpT+nsZaVGqCG
         GoO7fe1YDMYYa7MBl8DTjLLCJEMV57nMBB1eUdZeya6XoY6v7QEGIJr9ED9QSOPWUG3B
         /QcTQHrrsQ+uDVmgmKqCgoMOduqt9cBhgefdtj39JdcQnjLexIF45w7aIVTnZFYMUA17
         Glq9g6iR/8udP2LVJ4ly5ep+LF6yPO45QFlrWutEiVbHyJbrJvnyEKetLcLQJ13FyISq
         Z4L5TidSo8O4GUMHB0LAoo8Hv7jwKGUCdwaE3No4Qn/UMH47oXPzx4384dKWN4XPy4Zj
         ui1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566290; x=1776171090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCNGtU1Jw1+pZTjJQ+1TxncH3XzMbdLcS6cT8I7ifYI=;
        b=gCbFNjAv1k4NJaqov0FIdDeHB/jy3h2qc6ftsoqLX+NZ4m3tsGAXy6T7svjXk9mjkK
         DNqcaT6MYi1faVKs8xnwXsH9IheljDr+mk53BxGf2Rch96h2tWR4MJT5ZaM+bwv12dbV
         +A/fP0C1JOPYjArZgaIjwGM60Y5Or4mDrh/KxbAfs/4pk0ozPZt9ZIu4FZKmiT7ct85P
         GVeKRkTuTgEOZaNggaFLWr3nQotHcBAWDX38xkQbU24YTP6VXf9SLN+rbTXCLDIxkki9
         t78C6zDrP/xnT0u9nnjQFZzS1Ll9IgwIbOGebuPSRJbfQsWIuurCbdEIwBvyR+6d0VaR
         X/0w==
X-Gm-Message-State: AOJu0YwB8/CLZFtGaCOz6R2psUpnPBUGTiZwTqvJhLa/tJK4Phz9rgzE
	QpL7RbBKxE7mrDKGqrOSSIVBHXGI7L5Qo0wtW1GtX91MNqTDZnnaxlsVE2sYeM53+u51vLsr67Z
	h/9RT1Qa61NzkI/eqnpSEQzztGMDDQLtkgSM0m3/O0rZJHktl3kNRx4fgm8ByCK2T
X-Gm-Gg: AeBDiespT3S9hS1cjc0X0G3SFuovbh51nXVLsuVjfBsk13jVS1mHSS5cGZY9aCJ3+fz
	dFAfJb/7oM/u6Mx5xN607BgNl0fNFZGjvanifOSQjuNNiTLJPCj012XRX0ykkD0FkfEI2vVIXYE
	4qfYWDx+Apey2zXyvGRI237j14Op6Bo6TP2TjsEoDxetfasMvL80neP0yT6ZrWG8SXDQRAg3pkC
	+v1zFT6MiUpos7bwtibaH1h/55MGm4tPX2aBAR6me9mFJnR4CQAo+fB03vXUqTMFgbUUf9lEonl
	3HLzbGjwUwbcoMzAtZx+KBR/AKs5bHYci04JATPepJc8mAKMM1vYbgJ1Mtrr5rVK8crGxsvVLgf
	eP5EO3d8r6TDP9JaZF2UfBke/3dtDNUppUi6kkiE4F7zoLH+iUOg=
X-Received: by 2002:ac8:5788:0:b0:50d:9192:b9b5 with SMTP id d75a77b69052e-50d9192c75fmr109941661cf.32.1775566290592;
        Tue, 07 Apr 2026 05:51:30 -0700 (PDT)
X-Received: by 2002:ac8:5788:0:b0:50d:9192:b9b5 with SMTP id d75a77b69052e-50d9192c75fmr109941291cf.32.1775566290164;
        Tue, 07 Apr 2026 05:51:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm577526505e9.7.2026.04.07.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:51:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:50:04 +0200
Subject: [PATCH libgpiod 13/14] tools: gpioinfo: use correct function to
 free the resolver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-treewide-fixes-v1-13-66c9744a56a3@oss.qualcomm.com>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>, 4fqr <4fqr@proton.me>,
        Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NZsMptbkOwNsKksPpOvizao7mCp+Z1K0TOxxSj4dv7U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1P2+qz/37pfyN8LU1i7n8gMewGWRGZqyfAHby
 8eWMQ1OhTuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadT9vgAKCRAFnS7L/zaE
 w3n1D/4ta/VC4AKDOU58T0tfhdUuMRyCUcgFX/cb7MYYmd96X9bppTCv7I1ou/V0F4JdEMEODxZ
 SuoEwSwlcJg1IuQkxt2GCJZdcpu4WZjIhhPHiYbWs2UwPgzRlfdHauVNU0JpkmQ7hGgoSl4rJl9
 X7lp9SP/HAPjhhUu5Vh8joqXFXukoVmnzrsEbu8oVjMtAg9iCYOboCniOKLMbEvXPWQQBjvIOyu
 usccCGrsuco+vNV/v4Y/Hr9/W5+r7CrVd8egU717uRA8w7C9pATl4isCNGPr5DasIY6DXxYM6ST
 HMsfgFZKEpE0f2uDuEY4WV4ccAJ2IHYpS4CevXoph3OgNezEPc/O4NvsV5KcIN4FKa2GARVyqBI
 MgKK8/RdXK/MXoE5quvivhlqtM1xBj7G8lGbJh1g/54OWQmDo/0BCD1GvLem3y6jS2V0Lcvz0eY
 lstSg/x+o9BsAVC+dHQOtmAlq8yds+PyF1jgluJcsAk8TPZlAmvGXJTA1Eno8rW2FNl/dwyUKZc
 MdyhPeHIZbGAQFvGrYaCg///PxLAx/5z53eFnSI0OAAfYj0vSRpgEIpHQpoIWsmJcC6MJwxDiRe
 FPJBLYkiQDL6MIGtoSW3nbJbxPJOl9yOVJ+Sjz/E3fqXNd6lD7zvYeF46BG3CmUtsmqljDj4u27
 EBfQDasYAu0upLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4fdd3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eqYQH6FOjWbGEqIZXq8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gcaulaqr8d5wmlIEqVNcM4n98KWXrENH
X-Proofpoint-GUID: gcaulaqr8d5wmlIEqVNcM4n98KWXrENH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMCBTYWx0ZWRfXyoeuZMfwD8eO
 9N+t4yUpyx28DBc8JF+pGANgFDZxww6a+SD35mv0RDoW0zAj06fjRq6ugoN2Oyz+CXjC59J/jXu
 GzHI0JVGohNPZIzNumQvpwh8p8pnUap5AYKQKf1F1jDuj1ya9pqEd0RreO4ocZd0p0wQFnaIVTv
 02guKN7EgBKTXmHkyT4itCSFlwhFo3A7BnFj4xCCejSqkOdK7aLh3oaCSW66O81CI48ujqyJT6e
 lddWwGZPebJnZ1L9dRgT9EYJrpuQCazUK+oWZsLNXJhLzuYf5SYNw+9yJjMTfochHdS3qJdT7cv
 q+dZs7MupotX0tiHpZqkkm/H5vOTkBjqUEKMMsNtgd9JB7KcZCQ5CjB/V2fIz9x9xeuVPZI7gEm
 XfYDrWMx0iWNMs5/8Z10AwAUL2ZeAyz8S79JWAn3yvsV4c4w6ScU2RRHJJ/8/LKQonNfCJGP38h
 ifuIRciwP3R6BJWDY5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34800-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,proton.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,proton.me,xes-inc.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DBFD3AEAA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct line_resolver should be freed with free_line_resolver() while
gpioinfo uses a regular free() resulting in a leak of multiple objects.
This issue is not really harmful as gpioinfo exits right after that but
fix it for consistency.

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Reported-by: 4fqr <4fqr@proton.me>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpioinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 4619ca78bd164e931757bcd7273a2c6920bf86ed..007d944afb26848c41e7117f9307eb6972c72fbf 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -266,7 +266,7 @@ int main(int argc, char **argv)
 	validate_resolution(resolver, cfg.chip_id);
 	if (argc && resolver->num_found != argc)
 		ret = EXIT_FAILURE;
-	free(resolver);
+	free_line_resolver(resolver);
 
 	return ret;
 }

-- 
2.47.3


