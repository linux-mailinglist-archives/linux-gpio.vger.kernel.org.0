Return-Path: <linux-gpio+bounces-35474-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEIPDnY162nRJwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35474-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:18:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2345C0C7
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DCE33008238
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE43B379966;
	Fri, 24 Apr 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LW0/RAIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9AqeY4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BE3033DF
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022105; cv=none; b=QhOZBZThcufDqJ8+L+vlX04b1G6jArLn8qQI1VvGse/le/vERDbxtLM2LBcHV8oHQb8j+NIYETsfFpIKAZNnyU2S4jn6JnDRFqzgCDbEDKrDn2fSVXEX+HT8uIRu9MrJXpKEo65EV0Ir3rB9FzzIl6QYgr8zXK0GuvOubuWik7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022105; c=relaxed/simple;
	bh=P8vn0C6citzGLq21XMsH9ZxmLpJgJ84HjMtovS88ioA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMn/smHKOdyHjSKBCsHCtqYW/ooAn34o7WIPPo/Zp20KcSciWMZVILUUxxpZfsv9zZgqGMvpl0ZwTShGGD4dbt1udkem3Ot3EIpgn7PlmrfSNYFWySAHlnmamJkLE4c2fEaFlzaMYienhH2lo5lLaFjGF/ND38XvcU8K4t//598=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LW0/RAIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9AqeY4a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O95h7J1533417
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dczzA+m5o+RTKSraLloNXSj8G6ES72B4nPpYKJunUQs=; b=LW0/RAIxOjQVPymn
	ologMtlRuvk2V6PjmBGTPQWoxBLy8o6wPDo9MK3ylzlgQ4g4kcXbjTNTS8I/FDg9
	6Xwe6bye3fRFjbzeP6eDgagO9OImtMNrSTDGyBHNI5RnZxK0bj0epGZxkfwkV9T0
	RhL/bLMjyhUIv6gS2dl/ftHqGLHl64l10qYFkjUjbnVmsQXsg48NiBjmGUhRaoRf
	biRKb1VvoDRsMWitmzBF2lqve2rWZT+12v9v9TFM/xnL1PVcXe2UaPD9eBBPUZ8q
	zMXgsOy3d8BYMAgU7uPjLrU/oFkhtwzLxU29RNwNqvAYIA6Fg/zNnI9I2V6BDAwV
	FvmnDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kad6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 09:15:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso207391301cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022102; x=1777626902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dczzA+m5o+RTKSraLloNXSj8G6ES72B4nPpYKJunUQs=;
        b=j9AqeY4azQNRJ155XSCywNS6186ic6CCTz8ZsLbyNfOB+mG0n6V9O3fZAUk6fz17Em
         AsBQcJXes0pWqIgzvcrl9XXOg1I5ddQ7jRHniH+tj0DD9AgMfpE5nXcRLaT2WGxcUDUC
         /ir6DmqOL3ywO6/bRkVU6dH9ELX9g7z83yDfP1U23b07BLInMFfoVl87277VWdSG4tew
         Yzgu276RbpQEu2sQL077e2FaJ2RenL9jk2R3v6TbglDbskQmX4HtDg6JoD3XePoyAyeA
         BN72OaA38k8+BRgtcoIS6hFbdEwYMOHcr8Fu53eGfizoqYdtWyshkm9CNbDO1AhkCzaw
         2zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022102; x=1777626902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dczzA+m5o+RTKSraLloNXSj8G6ES72B4nPpYKJunUQs=;
        b=T/Jxag4fvPhaerdQF3FUrwl3kVecGNuwtOU9mBUyFSe601V25ohobUxp6n+kH8o1jj
         z/PQzk2OT78yPJ1Yo3y0Efs8iiXETcq5ZfcYXeKBweA72msx6auY1qYObpQeOd34xBT8
         DPTHvPY6PRI8mS6x2yhio4Nr469LN11tKsSg87jMfbLrYSriVIDWexC1TBAzhGY/NdKJ
         aqJ4ify5FPbNcof1xquTv0iieJa8XAWNlWuDS1VR6tVbJFERccLxmENgnqvOYijBuSFS
         VlTFIAV4Dny/3sGNF2sNYH2ozjo9gaLsRv9krsxF3f/yz/JPm6nzLVw0U2cnmvdX+rC0
         OJpg==
X-Gm-Message-State: AOJu0YyYZs08FQwaisNhoDZYWEtJAEpJqlwMcgoYVOK977KdN7KrKv9/
	ToFJeRpahAx/MKdlFefUdaYZID4ne0eglYz1oztGXDWhZCYoeQrqGwPc2pDtpYzBO4mu+djlxL9
	4CFaOKVSOebL6pLIXWPm7nwQf/AeeLz3fIEWL9buDumEDH7jVWt2gWzNxjp+eM3WPD2E9EZGJ
X-Gm-Gg: AeBDietDYtAluuflzSogSmBIVlFJm1cTYXdrTaXhZAydeoRb74tOAiIc8wA3sMF9NQ8
	TEfGyGk2TeTakNztYO5G9AexB2YYcA+D1vi5XHENN8qn2aENgiUQ3WJ/NxzFfvScj+XlBW+BwhS
	g+Y+tDFUuzzDmzJ7uw9H4H1LDFNf7go+2f4U5rW5dAD4n9P8LT99hiVS2XoaPUm54D3NTIJmT4C
	Wk05yDObmqVqozoT8U3b1oc5vwT1FxYOc5x6uyyUgnN+sdVsY2a7CXTi4DL6nbLPEoONdDGbWeO
	d3mylF1Ge4gISxPPcNYoFgmr/iEV+4ca/YM9JjoLnMoUPZ9FTUtZKwfJubJ1DCJmtaSQx8YQDTE
	DyJknrR5TOH/OhSGaGH8pbfVTRnqfYtaKUmz99PoyhBZKqkA2iwfUUb5NAUQ7
X-Received: by 2002:a05:622a:4d94:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50e36c51196mr439857521cf.44.1777022102134;
        Fri, 24 Apr 2026 02:15:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d94:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50e36c51196mr439856971cf.44.1777022101249;
        Fri, 24 Apr 2026 02:15:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:35ca:88ed:3f2e:db28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm386567315e9.10.2026.04.24.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:15:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [libgpiod][PATCH v2 0/8] bindings: python: modernize C extensions
Date: Fri, 24 Apr 2026 11:14:58 +0200
Message-ID: <177702209523.44726.7029839955267203403.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423222125.29097-1-vfazio@gmail.com>
References: <20260423222125.29097-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HABl1cLJ8Vm8oJLC3aUfdee1Ov14eTkA
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb3496 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8j6Xd8NdIVo6hSJ-GiUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HABl1cLJ8Vm8oJLC3aUfdee1Ov14eTkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NSBTYWx0ZWRfX5gPlY4id8/1K
 zcC0G5iLfP5e26e4rpyI8uiUxMY18PD7icoAlwrt/0amt1SuGm8GCLGGNZ+Vg43clO3477ElSOz
 d3fndAw1utlQUe/fjVg0Ez/fan/J6Lgenn1YMfnDzTuJOwBDuGglWFnaGbRVwaAWqne6vvOnLcH
 8JG55zZL5uiWd/JzBtuczeOVlTrVrxtqNzRqSP5bYGJaMICMnbgUekchjr3/K7uo7K6Gqk5PjVY
 OQixY08yQSwKJtclgPsQqg5wdd1vSS3Kq+KuQCzFrlv34DEUHkZRdl1LGg3ZN3Q468zjEF1vwF6
 J7ulwaSPZI3Mld1Tm+oYwFE2xCssERttIuZzY7j8VJfcjRe7pqd3+VN0d96u3DyjA02l1Qhu8Ry
 6rY+2kZoA5VbeeKF9PeIdusqOdE8dxvObML9Ll/vx65DrsngTNe+JQyuhYq8D7xujYimk2mZXY/
 Z2s0J4I4F2f1oachxvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240085
X-Rspamd-Queue-Id: 90A2345C0C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35474-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Thu, 23 Apr 2026 17:21:17 -0500, Vincent Fazio wrote:
> This series performs some minor cleanup of the C extension modules and
> migrates the module defintions to multi-phase intitialization (PEP 489).
> 
> Patches 1 & 2 avoid calling back into python to perform C level object
> cleanup.
> 
> Patch 3 introduces no real functional change but simplifies the code to
> get the same result.
> 
> [...]

Applied, thanks!

[1/8] bindings: python: avoid PyObject_CallMethod during chip finalize
      https://git.kernel.org/brgl/c/53be72baca59ef4488f8c998d9cf6b172ad9aa00
[2/8] bindings: python: avoid PyObject_CallMethod during request finalize
      https://git.kernel.org/brgl/c/e5b6f6ecb9f81097129d6d05b5e6b2a1ba75d8d2
[3/8] bindings: python: simplify disallowing _ext.Request from being created
      https://git.kernel.org/brgl/c/55ce0cf68158bb61ea1ed52d4a827e7759beba6d
[4/8] bindings: python: use suggestions from upgrade_pythoncapi.py
      https://git.kernel.org/brgl/c/63d4fd7ad704073f6e629fdb66c4302cf398f502
[5/8] bindings: python: use PyImport_ImportModuleAttrString when available
      https://git.kernel.org/brgl/c/9106b6c190e9852157ef0e4f0683823862a289ff
[6/8] bindings: python: migrate the gpiod._ext module to multi-phase init
      https://git.kernel.org/brgl/c/89ffee834920bf7daa85b529ca9877b90d4d75e1
[7/8] bindings: python: tests: migrate the system module to multi-phase init
      https://git.kernel.org/brgl/c/bf4211f3e19bf6acea2e3a49dfd46a734dc90a41
[8/8] bindings: python: tests: migrate the gpiosim module to multi-phase init
      https://git.kernel.org/brgl/c/7acbbcf7789719f577d0ddba2298167ea73c57ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

