Return-Path: <linux-gpio+bounces-30490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FDFD19661
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B20FC301D314
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C23287516;
	Tue, 13 Jan 2026 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghY4oVx/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lxdl4LCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362E283C87
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313884; cv=none; b=iRTiupBel3QwDDyiMeEG0a0lkc78Y8SbAciSUtTEBbvayi8YXXanwMhdVKa5RbNcCyK5W4Z5dnq4iIO/AqROh77/spneXeebQjZPLtrV4bpGWyl60WT3BF2p48ojfleXGDBdMBBwpgckOwHmPEiu/ceMif8DpC+tOqItvNhGUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313884; c=relaxed/simple;
	bh=eWmS7bWgOMVz9JM9og6g6hEnbNmDexoSNEnvbH0xTCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+wyjRX7CliRauMoS/w87Q1E2/gQJ/skq8xauodzIomVjW1fEz3QArZQBYd1MJWKSMSkLl8cO3AAvkUm1zaRIr3AJO7yVTQRBkFhE3hsAZUR+dtkH/rJhBO2284G/IulmWFrlxF8daGL6xiCnw6Eq2pZQOS7WB1yP+j87SfnSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghY4oVx/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lxdl4LCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7nNR03299965
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 14:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AIrSo0ubetpKpD08JPR8lPNRNZRBEOkwruuNkuFkK5w=; b=ghY4oVx/yNwoqO4Z
	FOh8waBqeldxEQzg2Zs4rvEkkwCcFV9H49WT1n9rSSzCIqPreuqZdklO2kz/sYg3
	9ZOpAXjFD/tXzSi0N81+t6ec3HUnUPsgWdSfx5CsX0o+OHLDR0pHzNZ8V9MK3oVz
	bEGO+4+oXEm5KGjVhvpDXyYuiL6Lhszm1c3iZkSzWNPFG65b3tB+Qi6vpe+yABip
	vuyOPoJW7yl/R9T2R3XDqBdKbLigMhQYtesFSy6oa/QeqPMHhZcXZ44JG0ROdSnM
	42h88HmO85GcPLOKaJ5pPf7EvKKCP5nKHy7IKYP53hNP7NusYcy9BLn3QRia3F1n
	5wcIjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmb2k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 14:18:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so2079187985a.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 06:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768313881; x=1768918681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIrSo0ubetpKpD08JPR8lPNRNZRBEOkwruuNkuFkK5w=;
        b=Lxdl4LCEpbQD9o2dnqLSBkFN0g+CnFQpgriY+RO8ZZRKDavLFZAVX+64o1wNfEsxIG
         EE9bu869UI97SGbynmm4yC6MggM+RyVKx0EV7tsKOavaZ3p6/klkpKZ9OLN6/KGpgcol
         v+bj/8Am7scEMCMB4itxifd6FW8yXTmUHgiYEaXOABHuzn0OvcCI2ZWEqG6Vk/q1ZZwI
         70gWUO6WZ1teD6LdCvwDHRYV/jQ9misqGQcbcXFOuQXo+3jubu5c9rJXY2+TqM23TTOc
         o1Lu1hVJXabaCt24eOir2uPThptwzKmi9d4Rv95qVtuzLDgYGNVu0v9xLnlnOltl8wc4
         eamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313881; x=1768918681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIrSo0ubetpKpD08JPR8lPNRNZRBEOkwruuNkuFkK5w=;
        b=qY7B1RY1Fl9zpGLfklF9oUX1WWn5DwDfkfJYOu5LDTKIUjcg5ybso9Za9l7KNHMsBT
         aIx5K+iGK8yUog9TpvB/2M5d6PAs84thvjNKJ+RWET0v/JfSg8JAjtSRWoE3GuDY0ylO
         wkOy8JYAvmVoj4J8ouhwjm4Z5VcqnO/bLxnbfVAcPnx0w3bYdq+WzVP+bAH8NebsNLnw
         4j92Znd2jtOsIcGRQE1Uk30F631KZQ9hWW4FidSUAxKjaX56Vr+o8m9Vfd/0lUo9VF7S
         zgk11BFjulpEhBO6nxG3xN0t+nRDKeSR1LVA59G7BoNv+0+anajKbBZtSK9YrTRAktb4
         Nj5A==
X-Gm-Message-State: AOJu0YzEbkB/iU0+/WATPpBqF1YQNz9aiuq1L75EjN0kAk+iAuYqO07u
	Pu5wnY80ROB+sefZluKRA3SJvYt8kTaA7sJtw4WmO1z10z2LrTAU+1Epw+vX04M69SNl8NVISR0
	akDz9uzUoHc+LzQljwT/CFM7k1q3+R4ZWbjYT8Euk/YT4iDrl5lVcVSvaL9QuF4GZ881VRds4
X-Gm-Gg: AY/fxX4VC/f6e3GRQgmftehRo2N5453fEVEhVU7eCDI39SrIpu7JLApJzELjP1xFpLR
	tnzOLysOSz6W968x5G9bxAUjG9uxv9h/Ke9Zg/AcDADfkoRo/qhumv7GxKtv/rkzv55ko5Io1Zw
	3n1AXNGOyRmIhwrzdoT3n2Q0I40KOnd/7yFYTe2iLWIUxZ3Y6XJVeRAFbijOB6uzfntObL9aNOa
	1yoO2DnSXo3nIw5TKGQLonaXX9muZa2s9fWWjzx82LzqlL8ebnJsskOAo5SRg5YsQuiKxpyilDX
	grgB4cYfc9qppVI4qzDhNALXI5Pdwo2tameuMQeI8Lgcp5spAew2cM3hlthVSKywgnKui/y4E8g
	KFkw8BQrgQR+/baVoijBaADOgmOErcJ3mYkV22W0=
X-Received: by 2002:a05:620a:a110:b0:8c5:2ce6:dc8 with SMTP id af79cd13be357-8c52ce6128cmr82612885a.3.1768313880109;
        Tue, 13 Jan 2026 06:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3+l4ZggHxT4bZkd7ubtgTAvDzGeGlTL9U9zvBwANmmpl5ZpvVqELVvCS2bE86pPjh736D0g==
X-Received: by 2002:a05:620a:a110:b0:8c5:2ce6:dc8 with SMTP id af79cd13be357-8c52ce6128cmr82609785a.3.1768313879649;
        Tue, 13 Jan 2026 06:17:59 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bff4:6cab:7ac1:4ace])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm44450712f8f.29.2026.01.13.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:17:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2 0/3] gpio: pca9570: Ad-hoc cleanups
Date: Tue, 13 Jan 2026 15:17:57 +0100
Message-ID: <176831387232.81185.5901153939415758012.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
References: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kyNjozf_zLrzCyqjEBLngWzbj1fqjBH_
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=6966541a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YRumSWjxhpOvP_SUE6YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kyNjozf_zLrzCyqjEBLngWzbj1fqjBH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMCBTYWx0ZWRfX6VzlGhEoi8FN
 klHthdHw1JYFwjEo/Rw/N37fYC1qzvWxh+201OSdcwkVrigj4jBorhVBwxAxKlcSaeKGLUUVylB
 fERuieh717phq+oC3CJFPRBtJnoU4VHvXqaXgckGSDWTi+iz6JdturuZpFgvU1EPUpBpMM4dRcI
 JF6BidjlKC+1MyNe81NU9mkz2JD8Du3YjH8Im1M2LS1JzlCEnQKLH697lQQAw5Qp/kQixiho5R3
 4CxdaOQco5n9ALbfcDQrb8LKs9jjn6LSXfoCMTlBOWs8q1mJqtKO6CnMZs+vyh629pYNNHC9APY
 t2lpEmNPyLRI93w4DAaXQ6Lv/NivAWws5fk1snKBSFf2di8u7i4xM3HjGFPAGYtM2hi2OLHczxg
 e9SfgMKi/rK5fAQE7oe4tjQ3zA78Zmu14/wAUG5WiZMcVvnrO/Oafg/H4UsYhMJoo5s6rOqHekZ
 Vzqvf5b4ZEGLBnZIbXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130120


On Tue, 13 Jan 2026 12:10:51 +0100, Andy Shevchenko wrote:
> Looking at this driver for something else I took the opportunity
> to clean it up. Hence this mini-series.
> 
> Changelog v2:
> - rephrased commit message in patch 1 (Bart)
> - collected tags (Linus)
> 
> [...]

Applied, thanks!

[1/3] gpio: pca9570: Use devm_mutex_init() for mutex initialization
      commit: e05ef046ebb1ca879d885593130fa822ff664ca1
[2/3] gpio: pca9570: Don't use "proxy" headers
      commit: 053578d329e58cca98f084439e14cc2895c82b9c
[3/3] gpio: pca9570: use lock guards
      commit: 4aa573002ba6884d392dbfce24c3ce057f2dbb6a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

