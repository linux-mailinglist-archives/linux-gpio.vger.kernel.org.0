Return-Path: <linux-gpio+bounces-32389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FK3EYRypWlsBQYAu9opvQ
	(envelope-from <linux-gpio+bounces-32389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:20:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C11D75C3
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5339E302D126
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 11:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D369A361665;
	Mon,  2 Mar 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doPpf3QN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZRInxuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8270631280C
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450366; cv=none; b=NFo/4Q96R1oFY0DHKq5ioID3Hl+p7W7VJjHwrJAfD8W/huU0oddRXiYFXNoRGQrR9UoT9n6AcM+KBKrMNkcYpkta6MMnGfrQ+zAMkbXXoU7v/xyRtXMXBRW8N+F5SahuwAUk/kSpQ63D2tzYeahYeLj5yeBqdUITqTDHv7R9u8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450366; c=relaxed/simple;
	bh=oIVn0mqkcWBRH66YRb3FsivaiiWhLznUp/BusKBcMiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFosSzHZWlS0rscCbMoztQUHNzXPCULxi4VW4Y/3fc6eoag3GBin02+NEA9uWNXIssJh1OUEG779gPX1d7FOUOn776LijpuOlhZsfP9O1lxd61det8Oy2j8xkb+ndi2m6Br2hpSNBOUBiZ4MTAtUKVQm3H7wSv78/Hfa7XP4EAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doPpf3QN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZRInxuO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K2i3782713
	for <linux-gpio@vger.kernel.org>; Mon, 2 Mar 2026 11:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWkmU19QQD2ToPfi0Hd9njWLPViSCiN40keUONk1nPI=; b=doPpf3QNQJ9Vvj0w
	mQ2Atg6mg924Gs0eBwgmd0x3WTJ19OlNoardpIFBadqPuXfIqN1sKyY9BezDqFFv
	svDtWw0U6wAGzlout8wiRGHbV6KWNZbOMgEOBNIZptbZx30j2cJ8D0RuZ+JUl/Lz
	yrFR1U4MNnhCe5qbiPli/ok8mZZ1GiZ7AF5o9p4P4hy0WZOgeU0XHREFmfn9fI7E
	grcMkOTmxPefQt9rbCLBg6Q34s6jWF8i7AsNB1phi1wvfhESfPA/+LaoXCRor/Zn
	Ra+1nEz1Bzsa5UfY28QR8qiJslEJrW1ApG/akmGBmQGPb1fnxW/XTuvC/tVVfLhh
	E5JIWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00dkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 11:19:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71304beb4so2751412785a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 03:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772450364; x=1773055164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWkmU19QQD2ToPfi0Hd9njWLPViSCiN40keUONk1nPI=;
        b=YZRInxuOyaE1huO9CG0hnFHuVr1oATBtHSxH+325CXM3KSe9SA6r6JjGN7qm0C/BY7
         drlPGni4WtxpLSMLJWgO9EwWUQcqeMsl1+NjCBmD6rBPNKg3c6PEUz/orXb+tU2CHXbk
         ykYWoZQ5Yw+/Rw8jzbg+TpHg92wvEm2v8Csh2Zh93nSAZnhglq02YkXq5G5N0wGe+DAV
         IkGYDEb+A5fkiel5Zt7jKGmROREFLh5aatdysararqlimznIcEagMcfYV3JtNDbWtaWq
         3tgx+lxIfe87menHYxwQxgXEsTbNciF533g0FfcpwkGdcvASkwVq/jMa2bxspqydOUBO
         fz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450364; x=1773055164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWkmU19QQD2ToPfi0Hd9njWLPViSCiN40keUONk1nPI=;
        b=rGYBlSFzSp3vURLRgAVl5D7gOjSSsoShso8m4A8dGQ1KSSyVKoRs3P6bghXStnIUi/
         /H82aXCNq44Wyk3efZSdyE55wpg5qVYbYF0rHNklHFh62Hg2pDKZ5EjWoICg5r+WV1nZ
         ndoe5BNmleybWclVZsYnRsfYhVbrLF3Ttfl2gPVQqmp8w5x8CQaeXs3G3QhTMX3jb+Hy
         9ZdJT/sh8BCYVs84atdPMpbvOfimc+jIx0ecOByosCBqZ4Wfnu5UOlSDu98/sPsQA9gU
         dBS9TX/xBCCNmmhAcpgSmCIj26pF1W5/s/+dbfHcNnjLvwp+Ns7zBeHkJsTY5Vbo4wY7
         b/nw==
X-Gm-Message-State: AOJu0YwN3X0mmaKOPN7pjlpNQ+bzNUWmICzoBE/yBUMfOlZ/oUt1xg/W
	QcnV5UB34hfHBrkrkBdmjJ640jY/uB2LQwPGWycZEE/Wbe/QqGZ3Fj5tj+5TvpDOEXIZoYYMVxR
	eRJ4v9orAI+IOSMro6WgwMoABkQfcCZJuW3tdYZt+rOqXr+dXXbFegowygKPs8insCUChMALr
X-Gm-Gg: ATEYQzw3nrU1lv0PqK0yEyvOx1CW2kc7/V6MXQloLMREBq90LMm/L3zpQ/0bh30HsAp
	NKnzJPmw51tGMO2xUj5rVyo1BJPaO+vyh13C/hDRK7N2XypPPYdkviS5+ZoFP/aGx9q8USImWyV
	3VoXJiKnAncSujJ8NaZgTesdMDAHOFOLbhX50m5dToCJQvS95TOujSbgQ59sWteTlskuKSguAi/
	/QOR6N+9bpkt/5iL/R8RvYujyO7nFwgpRcsG1Q8cW/iPUyCd2vNAN7F/fEUVMIgUcLPzfigkpD2
	/yACa2tg0pLSuhAq+mk08T3PkKd9LDSVkyxma94RvqCsf+LQiA/Qo6DHQv1agJjnEf3M0SxVKfi
	r4L1t64wv1iwYhccARn6SrioZ53itGqJEGpd8mqsIDt+C62dcGyc=
X-Received: by 2002:a05:620a:2981:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cbc8da8a91mr1516068885a.20.1772450363721;
        Mon, 02 Mar 2026 03:19:23 -0800 (PST)
X-Received: by 2002:a05:620a:2981:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cbc8da8a91mr1516066085a.20.1772450363246;
        Mon, 02 Mar 2026 03:19:23 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3aa3:6bef:50d3:48ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm423173845e9.7.2026.03.02.03.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:19:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: copy the license into distributions
Date: Mon,  2 Mar 2026 12:19:18 +0100
Message-ID: <177245035505.65351.6177103336960333675.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228184158.25003-1-vfazio@gmail.com>
References: <20260228184158.25003-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5723c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fId9YqttwNQw2YxOHX0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MyBTYWx0ZWRfX8hvMUOCqiUOj
 u7P/17CH5Ao2gdGITo0YAE64MXzSTBWGItU47GJ73W3JOrLGmFuRHsFsvH42/24K+aW3sZiVXWv
 l0plqf2qbJZp5VCYYIz/ZcKQrblrS4R/QksPjFoY44m8hIAZjrDZdhJhHfiREFJYswleoo4/gKI
 H2bjDDjIS6QlBrb6Njz8LbD+ThPZyVUWWnwfQFwLRBVTt0l6+QNGduTF0gy4mYUxYxeHyM+oNPW
 plBdnyrlYSRDLfBA67XJuSJoOMgxb+gj4uzDmajzZIgVhI4bD/cbLpW03Srwndl6QdEcfBY0fa7
 VoANSHsLQoa4IESxPZpf7nuKALWjuZxSbOW90MYSU8SYT4SddpGhvgN5F3iH7wwJMyOLvDD77Xw
 Ocdg/ayBnC6HHUYn93vTs22shEnAX4d0g2c4gsBTPOpUXL8aE3pN0hqxhnDw6Q/6TFUgifguCAs
 ULA8YujtF5h80d0LeLg==
X-Proofpoint-GUID: FVKCjrFHyJY4U5HsWAg0CzAkRMtn8UcX
X-Proofpoint-ORIG-GUID: FVKCjrFHyJY4U5HsWAg0CzAkRMtn8UcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32389-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B50C11D75C3
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 12:41:58 -0600, Vincent Fazio wrote:
> Previously, the bindings called out the SPDX license identifier in the
> pyproject.toml but did not include a copy of the license in either the
> source or binary distributions.
> 
> This can be problematic for tools that rely on extracting license
> information, such as Buildroot or other license auditing mechanisms.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: copy the license into distributions
      https://git.kernel.org/brgl/c/21d1687b8882fc15dd78312049a97d6007b16c51

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

