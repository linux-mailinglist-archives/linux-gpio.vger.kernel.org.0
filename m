Return-Path: <linux-gpio+bounces-24345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED580B243E3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E98720E99
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87B22ED178;
	Wed, 13 Aug 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IaILgi3y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35972ECEB1;
	Wed, 13 Aug 2025 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072840; cv=none; b=D6rhnWJOasCRnkDvy45eTuAsXPot38/zACFc3uZS1gFwunF9yRwSlo6dP+zf+QvN00agvypKiwQLCmXTccttLWFFnPEGG+fNjL1czcnb3VvLopTO6smF/l96C2x8/iIT7ENLHxoIUrdEEAXtC5JVd6J4vqHuWo0Tnfs8isRFb1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072840; c=relaxed/simple;
	bh=kjnGFuyZ7406nq65KGuuYkIeois9eWj0YgJtbikgOzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V6AfbzcJohjnt8+39th34OykobnyzA9WqcNPa7NEe/v2l+RRlDRVA5HSHp7nYkDYIsvNIkZuISYMv8Szll9nJhcwDUiVfeb8KdadeA3tkkCSXSeEPmq8yi+xYVwWRhM9iXxMBUisyuFvYAqFOwqfu5tNtM6nWXVbuVjCzYNpa0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IaILgi3y; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D7SjKP013213;
	Wed, 13 Aug 2025 10:13:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Pf/cTBFOi74ovHiVIVGUm6
	YyAVK93Xyk0jSowmSz0vM=; b=IaILgi3yIqcO6TShPG8n7MCq9/4vKZNdS34OD/
	AhDLa9/Iez1Wr6feMN6jKTkQeNO9wxAVb609Vq4dNnmy9VwOHSRO7AWu6OepYYrN
	IUS31L7GcNCdAP22S3aEzsHMzevjFrWferkUUKPjya5gF6H4zHyOGPYn00f5LNou
	0aC3dYC8r60EzmdqGK8hPt1SXWoxWnvcWbkeIq483eIu0lGtVHnSY2byfBIoCi4v
	T+oCZ8a8v5TmdHd7JErd8xN7qHu7wZje0JQSUUKBzgHnC+CJhVvSm3qI6hULoHzf
	xH7kXmdjKkqqUmTngo5TzT3smfhMpUEcs4wxmnLO0zYGPp2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gdmve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 10:13:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3C16740048;
	Wed, 13 Aug 2025 10:12:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A23A71FDB7;
	Wed, 13 Aug 2025 10:11:56 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 10:11:55 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <linus.walleij@linaro.org>, <corbet@lwn.net>, <bhelgaas@google.com>,
        <mani@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v1 0/2] Add pinctrl_pm_select_init_state helper function
Date: Wed, 13 Aug 2025 10:11:37 +0200
Message-ID: <20250813081139.93201-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01

Some platforms need to set the pinctrl to an initial state during
pm_resume, just like during probe. To achieve this, the missing function
pinctrl_pm_select_init_state() is added to the list of already existing
pinctrl PM helper functions.

This allows a driver to use the pinctrl init and default states in the
pm_runtime platform resume handlers, just as in probe.

Additionally the missing documentation describing these pinctrl standard
states used during probe has been added.

This fixes a build issue for the STM32MP25 PCIe staged in the pcie tree,
id 5a972a01e24b
 
Changes in v1:
   - Add missing information about PM helper functions.

Christian Bruel (2):
  Documentation: pinctrl: Describe PM helper functions for standard
    states.
  pinctrl: Add pinctrl_pm_select_init_state helper function

 Documentation/driver-api/pin-control.rst | 58 ++++++++++++++++++++++--
 drivers/pinctrl/core.c                   | 13 ++++++
 include/linux/pinctrl/consumer.h         | 10 ++++
 3 files changed, 78 insertions(+), 3 deletions(-)

-- 
2.34.1


