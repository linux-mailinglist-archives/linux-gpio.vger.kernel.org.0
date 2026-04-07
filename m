Return-Path: <linux-gpio+bounces-34772-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLlqEUbh1Gm2yQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34772-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:49:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F43AD351
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 152D430567B4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A94B3A3E98;
	Tue,  7 Apr 2026 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2tVIN1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6aD/5Rr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F73A8FE9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558655; cv=none; b=j0p89riHIbjT3pFhviBt3Nh8YA2xRyc9PNDhs4VHzie2QTq83E4RSzkaLeP28WZEghQ+jjPpZxE3G7SUDGCM+G2r7ZNvLaGDaWN6CUOODsbXQJpol3bzCMFYBw8BbG6bAVk43teEWunZggfx2A2Kt3F6V6XYAnUVnf7/kDfUIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558655; c=relaxed/simple;
	bh=dbT+EHpqF7GM8AbnQBl93Mgk6MG8LLM/OIi1UF8EQME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZf1oWmhS0dxZNAIf4NZWKIvyzpXnw1zoeRoVxLZS3in22Np/FfOymyyD5AKHSoO/pKD9ALHiNVDBRW0Zhy83HaWg9QJj4JEVTPA64lWo1ZY8H+Rslcl48GZD8CSsRL83lM/UMcnOaIRYHIRelXn1+WJsGc5ImzEQcMphZFQKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2tVIN1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6aD/5Rr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376AHjr1404166
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKYD/kRPg9x6IGSy4BUNBa0ExcOjZhSZ6SbuVVspPSE=; b=o2tVIN1T2vTILs1G
	CQbf0eZuXvHU7Mu9nC/3HB9jVJXoyPEkl1c6+hNUUlB2nfbNUZCr1tFEIOP/e/rb
	fPPnGT89Zh3yVlD9vWwuCcoxF6mttyQq1FsyZiweZOWQDhsyGSLFcwHAVYcIITTA
	EdSwv/aNHPmISt9HuOHWtPCfN7UrMyQBnynQbVtOw/cbSsIoqDP6Ge590VJ7uXGN
	tLbLoLKySyD6mfE1Kv1G0mwbw2a3bNvO82hnyRNzY4JUmRZ8w1Duz853sT02BZtb
	BnepWlvFF6NfmKcZ1S9oskQ0wBuiGc2KhYJoS2oFTVNIwdes6KEiOPEOz3tl4U/Y
	t4P5GA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8abg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:44:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso62324921cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558652; x=1776163452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKYD/kRPg9x6IGSy4BUNBa0ExcOjZhSZ6SbuVVspPSE=;
        b=V6aD/5Rrr5qajGobAYcoA2KOqupNQeSbPyoKHYBarskafyxEncWXsrmZXMXtYnVfSL
         m3mKA9ffk499n7dbREfrJb1koKYk4qFA4u6brNDZCUgGmKfK9bWc1nR84sc/y8Or+a7X
         S4OyZBvcmGOeG+VnYA/qqy9ZX6gQJ16RzxqCCx8O3e7PEih3yGzMXYh+/MlGW/wpChqH
         oEM677mxzhlssGbpG33349iBscEadvXlcxVHq0saWU34KpYgYNIGsZJEdJrqFflbZGGQ
         sZy1XXYn0OICth2FbC310abpaNYBe2R+rl6PqirH96/K2FSdPf7d0r6CFornv2QALQfL
         ezAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558652; x=1776163452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKYD/kRPg9x6IGSy4BUNBa0ExcOjZhSZ6SbuVVspPSE=;
        b=MYrNSmihssCLPYINBRbHMzHm0nxYklqdf5UKsHStkedRo8B6rghjHMHODi1Tnn4oBL
         vUgYN47t4hlzoL1uO/8IbRRDZzLr/+3Uz1K8p2L7SfiaVMsaUm1q3o+EZIGf3tgFEaOt
         +1PqTPonG8kjzwNaKWYQPEv7roTD069QTrTXwsHg6cx+qK8JSLLmOUxpWRbfpkfvJDh8
         pqwrY1x4BvdrDXhsLnUZwX5KpJwMIK1zH5zHAJ9+BvRs/eZhedDK6tscckb7qf4NDVJq
         eGpzZGOIdwhOPid2/NlV+WhBwcpo1+crOKEA7ptJtQFZc0XgfGCWAz/8SkkDgkiOhJNw
         yZHQ==
X-Gm-Message-State: AOJu0YzsFobZJTmnGQoeZNSftKFDRIUO9OQdZR9OOuFQmZO1j/keE5Qb
	zJrYi3q4Sb9azay+L9wxMFHz0QjenVhzBNYDb2kg8uXsdn57g416ZOgVmrxLcRQsYS8ayS7EiCt
	BOS5tfDqlPs9CYvsJYrlKi7G0mjTawoVVp+C6yTCpG8yap1gQj9hlxUx3IyI0MGzLDHpH/pzZ
X-Gm-Gg: AeBDiev5gbK0fVvN7+qR6hc6rmF8HfPQduMcHsK4TLA4ffc3w7Q++uTWEbI7PhDDba/
	BoRnUyxmcvMgFrNIjxBh2ZM6QLaimgAnssHaYsw41RBaEFBR5dlYReWqJ61B3FxvruG2+KchCSN
	QZsq78FR692BGo80NNXSiUZAjDNqjYQ+Y8Tu5nDbFTi03MtiqmJ4FK/3+IPam4Ht7EH9dpwHb1Q
	B7BQxkuXyIlknupK4lIjEKL5of4S1AQ5lFMUXOaaYqg9dUMKKpMxLYHFQUNMpP6XjpDIXNVH4Mx
	z3CKTWhRL8IDc9qLUlcrjvn2SaF6IqEopvmSkqI4D6DlwjdAGaxkGKSk/uBw3qB3y8kW3u3KNq0
	2ttVhu2YxWvwN8NtFrpkDwhdszIWEMUcZ/WYIUmg/kTVXO4AZQQ==
X-Received: by 2002:ac8:5cd2:0:b0:50d:83d7:686a with SMTP id d75a77b69052e-50d83d76b4fmr145298401cf.40.1775558651610;
        Tue, 07 Apr 2026 03:44:11 -0700 (PDT)
X-Received: by 2002:ac8:5cd2:0:b0:50d:83d7:686a with SMTP id d75a77b69052e-50d83d76b4fmr145298261cf.40.1775558651172;
        Tue, 07 Apr 2026 03:44:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm64902885e9.3.2026.04.07.03.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:44:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
        Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        mika.westerberg@linux.intel.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
Date: Tue,  7 Apr 2026 12:44:03 +0200
Message-ID: <177555863862.54615.339438829965550886.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
References: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YHUt7udz0prE0n9isj830ZYH5AnIWX9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX+2kaSmvkmgwP
 XoqqcYAK23eNQkuS1HB5bhwA13vVMpDrzE8dS8uOkS1FgE/ugocmpZ5ni6WDR4Nw6hVLm6835ye
 pVlNKzckV2CkfN5kALHwzubtkK9gwl+D5SS3jBXZhGhyS6IxCkoKSUKKhX63EIXh3kLK88EgzrB
 vlydeT0gyHJOpujR1dkYbW6OBmx4unvWQWakVbBvvJlWyN6sLI/02dxwUQZLmWhwsvlbFA7e0ov
 HthiIl+yNu7yA5HYWO8wZgtpOIBrkG3svqWn78KLR2kmSgZxSuvEmWSG5ChZdBteFhoRI4MqH8A
 XFhal+xpwmZtx34cxAr7Dv3vIH80FV24g3uSHLp6rQzwL38GMANoBWeOkE8TWq+WPQegpJhcuii
 utoDzToWfa0sexTNs88avZgl7pjwQbsm79UGhr86UevaNsi663xYFhIxg3jHhYSuXP8tl5GC0eE
 fWU9/43/7SYq8tbUu/A==
X-Proofpoint-GUID: YHUt7udz0prE0n9isj830ZYH5AnIWX9e
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4dffc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EFXsors6KeMqui7czwwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34772-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E0F43AD351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 01 Apr 2026 19:45:26 +0200, Alan Borzeszkowski wrote:
> This driver provides support for new way of handling platform events,
> through the use of GPIO-signaled ACPI events. This mechanism is used on
> Intel client platforms released in 2026 and later, starting with Intel
> Nova Lake.
> 
> 

Applied, thanks!

[1/1] gpio: Add Intel Nova Lake ACPI GPIO events driver
      https://git.kernel.org/brgl/c/15cbd66b69a9ecdc5c3638aa400ca9b872b84509

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

