Return-Path: <linux-gpio+bounces-23800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DEB10DC9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 16:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E791600A9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 14:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943942E2F15;
	Thu, 24 Jul 2025 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xhbmu1O9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3745292906
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367849; cv=none; b=Z8I4HsXTTPZcjhjaEvwH6jpuT12rmtsVoK/1dKZrtkIisDy2hFClaMKwkBr33kcfrrbyhUziVvrLxsFnI3iuW7ohTPzrml2H5u7HeGVmVZYVY8MyVqTNooWYF8qZVRdgXlXSXcfZRQC1AsL3aZptc2CDlZIQFk0uKF9YX+gkvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367849; c=relaxed/simple;
	bh=iKpdDrV3kOuTOMc9bKV37vH2GuPaHLNQYpIK298DPUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HE31/bZW43yORF3G6rmolTAUgvLeHQ9oNi9V2Zl9PN366/r8LMc/Q4b5u1FiCWnwgDY7zYV5jbV3f/TX/FawwNeXUvZKZF5oENBRygXubgwWyxK+eAeBBfvNNJ9mNepDZbZAVtAvXWtwADALclzfdzuvj9qJtB/UIgqufnEr/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xhbmu1O9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9lsPJ022030
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XR+fnHt/cqBwBuufCMHCP6JVhgYBVarZl6G
	D88IpMe0=; b=Xhbmu1O9XrQSBkuApyIbBeOUQ5dV+hozQWqvPq1eHl0bWT//51a
	Uq0SGquOrhR8V/lelPmCfREeZQ8AQHts3oGiEHgCuajusctPIaGG875wtO02+esi
	HOtULLor6lThCHfGhZTfNayT8UbUIuH1MHIcDzuDV+HhYWhwQDZ9dkrkTCocUSUl
	ViEEOo+qqmODjqXdYBwRjrhUmoH0XrifcIRxqzrm/gmkJaD1KYPPdDedaCoUMV3k
	Rf0VUwiloug3NktoSTHYnuJxyggp5+tD0mcVjGtfXDh/ktkDVgwSWkuklgr2urRU
	8fjzBAkjplcfyodESlyLo/xCjC5+yHXRjNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dru8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f71b363so20185206d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 07:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367846; x=1753972646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR+fnHt/cqBwBuufCMHCP6JVhgYBVarZl6GD88IpMe0=;
        b=fOxzvcDWOQ+AzbOtqPs2S1Y5d74h2jUyvUwtSjbeySHB6sbja+4yig1lbkaBXbxGvT
         pq0++ZzJ6CBbBHjU4mXSJ6FGQtWym7ndQE1UfzYAJXz90XQDp/uO51OOGWVRXf7spZRQ
         RtjwXV+5uLWIf3nuNW2lv1wkfcvUgl4dXNMFAyx+R1XDe5yJPOaAKBnsqbEXNNbD1nIV
         gbcDI1Wn+pnt2XGjz7/w9AZtgVzTlOZAdGNLzMiDJHVD2eMBy18jOqYNT/Y+fCtzy6QN
         P/WUloybLjtUTkwSX+R6uM5kcBMtSAWboD5BDxZrLNhF8ZUdVPXrG8TsJg/PltXZ51W6
         FhiA==
X-Gm-Message-State: AOJu0YzFIpKH7TKH7biNwnY7xeNnM1RvW1nOgtL71lbRxH0TX4YIeSJ0
	ZfaeM8hE9GuR+nRjMCP9Wu2tMW6EJA0m8vBhVKIVQ86/pW1tqb/UeQYfXivf5hNPpPzxSPNmZrO
	Iavml12+1f4hX3KslkfqUPU0+xe5hguSO96OsyK+7we6nfcqxRIqfBP990RYGGNqf
X-Gm-Gg: ASbGncv797/kCfEh+Lr1kmQ3L1N6Eci42gcgnnfSF66tMVkmLq4743qHkeBw97CogLa
	Tam60oNHRoGlnmK8pD8MeyY9NDpUHQkFzgV9Tkgo2mj5pKLbuqF1fl58OikTlePlCQjI1rV4NAM
	tlQa0/3geulcJ1ErKqJSMudagQkL0uO4tc8B9yMMhgpajf5pI9STK7Uml1r8Ug5zf01H7DJfSJh
	UGp32ihLi2CwfkSGNuv+qG2RTYNTqvu7EMG5vseMSw/ZcnH/LyuugOYMsaS+bTMAfrI78Uq97an
	U3kW4WveBcfU6CkolfVwn9irirtSnc328UBvyRpR338AAuMoHXL8hGp2GyPDcczgsg==
X-Received: by 2002:a05:6214:1e3:b0:707:826:1ab5 with SMTP id 6a1803df08f44-70708261c32mr74163276d6.40.1753367845641;
        Thu, 24 Jul 2025 07:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc5FI+9v6XLNucNriGBwsIEQ9dZNlTaDhhPu74MX9L6L2A3ovmGB0HEuxN22mlYUvA2rHdHA==
X-Received: by 2002:a05:6214:1e3:b0:707:826:1ab5 with SMTP id 6a1803df08f44-70708261c32mr74162576d6.40.1753367844954;
        Thu, 24 Jul 2025 07:37:24 -0700 (PDT)
Received: from HMOMMER.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c495f02sm122856266b.2.2025.07.24.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:37:24 -0700 (PDT)
From: Harald Mommer <harald.mommer@oss.qualcomm.com>
To: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] gpio: virtio: Fix config space reading.
Date: Thu, 24 Jul 2025 16:36:52 +0200
Message-ID: <20250724143718.5442-1-harald.mommer@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68824526 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Wb1JkmetP80A:10 a=OcK3cvsEmbn26l3-tBAA:9 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: MMOu9kGNN1aqnq5PAUFAS88ASFGviWr2
X-Proofpoint-ORIG-GUID: MMOu9kGNN1aqnq5PAUFAS88ASFGviWr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfX/9/FJ6aZgh3T
 iu+KGOU77YrwK7Ki5vq3bc24uMne8DObIt/9HNwhNVitzm/cDt/9svOeDN5UDUzUQrxQasYmq4B
 MPZNQUrDoeU5rPhXzZNYxrY3lDVy1V6kVQnP1eoY9k8b3qQ0fmYj7P/jMVvthd3n6Hp96EotZIS
 1KX9tXyNsFdbf46eudcvfx0/WEo8lVnHkoLgc6LZgup77F29rF1d4BwGRWBPtCwZqSWzc+GyMNw
 IQ2fkh62m32Ud/p4KQKEISqtWZFguRCBpBzkJB+z2IIqoExnSY2E6nKUC3CG61sgQajCUni+RBX
 1v++5pjQAZxved0/kcjznxhLkSsjlaFUaHIGk/yMWDM1krjLRfaCHJpwFxB6Md6y+PZj9Xw+Lez
 yPkdCJK4uEAFYYC1mYWCoa06ivK8a3h9DLbAS8hYmaeECkScHKdXf1AKqa5pfHRfsoS9qRax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=905 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240111

Fix for Virtio GPIO Linux driver

The Virtio GPIO Linux driver reads the configuration space in a way not
conformant with the virtio specification. The hypervisor we are using is
strict in what it accepts so the current behavior causes a problem.

Builds on top of gpio/for-next, tested on Linux v6.5.7.

- Add CC: to stable as requested
- Add Fixes: in commit message as requested.
  (Problem is present from the beginning and was not introcuced later)
- Add Acked-by: from Viresh Kumar to the commit message
- No further changes to the patch itself

