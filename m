Return-Path: <linux-gpio+bounces-27480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06016BFD02B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 18:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A69CD4EBFA5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A17126E71E;
	Wed, 22 Oct 2025 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jU1KtPQ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA4E26E6E8
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149056; cv=none; b=caU7sVOocf0l8lzR3vHXIY0d5hpCTWwRhaErnMqNn7dVcnp8MM3uNFbTl6DX6Ys7gDGhSm5i7W98ThKz7vzHr6ZIydm9C7hxUnnSHZe3M6utJMF+6MQ9IgE4eJHSXMBUeWR46P3/tzw+kmRFRLkm9PVnRjqld4c3gGZLDgnc/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149056; c=relaxed/simple;
	bh=e9dloVwz2IYLCTd6/6lhRQqbdp+a/HD6E3cwzE0aIoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hK51jGMDl5JRRugtiaBiz9YcruupMq8d+5YPeVe7CzKlMV20hSPaq9cq7GKQlxbFCpbc1tUpJRV4DxTq3my4KA+Z1Ewy03fVqmQDbQ8YP29yqtoNzOMbXrIo2eW1w8o8P3PesIoWDmM8KTIo8sdhrM9waGkwz5njxg1yJY8LCFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jU1KtPQ3; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-93bccd4901aso583875039f.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761149053; x=1761753853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zv7xh+mMIOvIqIsx9A3Dp8OJORRCn3/CUdVaBarbmo4=;
        b=jU1KtPQ3QiLN3BpNrav1RdeCUJKAEndrVzKm+I4fmTjURsfXNpP5rcrRr86VxyUTMb
         W+2JKPEc6zS3EhO55bdYxszy524B5u6L8fXBnIPsUCyetPN6Pzt7zb85hIBd0PVTp3ny
         GNmybC8CpLT2Qcs9oLuokvXKna+HOspvMjDEJ0BkMAb6zc3P7uzioGNKhegxJ39yC4+H
         TPDohy2Z5JuKtawWBHZnbJM4HwkUZUPkKvbVYnrro8MG5UsFQIR6R7ccqzj0No+cCNuu
         l4q9q2KxJTjIpuDU7IVOh3773LzGlvOuV31GZzdcsrZ30JjGn1Rh2JgZcqCN3aoT00Lz
         Elpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761149053; x=1761753853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv7xh+mMIOvIqIsx9A3Dp8OJORRCn3/CUdVaBarbmo4=;
        b=GcQi6D8ILJa1dET0fCGsx6dlLbCtlU+K8cUe6nvHFN5njxb4s2wD8M2wBODk0SIZuE
         C0VXt0lGHOhkRyPmZ4bd8r7npDYtG8n0LCoTJNgAc6e87mBar0i+XOP3GY4NVddIUe8E
         xT2asDJ1J6y1rJR2rzV+QyLdGRZWpdCFkdUiHF/j2M3RnJzVKTaMA5p4QPZ1mA+OJLdG
         YTv9oM72FYJvJNENi2hvEFG/3WNJWwyyOREqrmsoKiCmr57EDdPzs6BvQLtoxdqcDkbw
         yD2WONIGbdq98ispgbPsvWcjRSzudwVdLbifbT8eFx9yY9XXPExWdpHQKHICfrsybGo5
         RBDg==
X-Gm-Message-State: AOJu0YzcXdnfYVz3qHBm2fkjFravAqsjN9oaK6AbRt7KjWVj+RRv/Lqv
	ePop51k6dv9PPOoEoJlD4IrUKbQaBuG5G26YDqsSpYPkTxVfl2i9utHdae2uWfD4
X-Gm-Gg: ASbGnctkNMwRmSy8WMeQPcnQ4FsCVyPPfBF3ao79H6QfVUGE8+PjkjSTamy87Qkmxay
	MonvRZAGF7mEgihIkhCBfJzz7+5OfBVk9VU6OCgTgWXND1HT8QTk9Dtjr5+s/LpWahPg6K89sjv
	ync2LE+AqNODbvw1ZSBP92KQVE3D/mra9+y4iaNwyKol+hmyZ3edzr5oJfscsyjBelkw2s6mPfi
	5lKwGpwzVhOzAbFrJqmoDI+MSdax3oxL+ZQidXdSQwxjk/oAoEC376N0UUJ9u9x01fhrC+va4+m
	coRo9rMwKejYf2foTcn+xh39YRpcSqTxMxW45eHPgtTptaFwWyIMkhh1iQmjqysumCcJxacNd49
	4wfsQIit0pv24xdV+r2WcmIpCG0cCKXUnd93BLjQgVIE7pPBxrGaN+fHSuQD0sXXo0XmFHm1eDm
	pI5Wi82vuwKCKyAcQ=
X-Google-Smtp-Source: AGHT+IF7wvwmavBx66O4FlEtqqca1ZVv0vUMOFv8M6F+5B9pFOBKPDh0w/6tSa01KRCL+9SJXaqhMA==
X-Received: by 2002:a05:6e02:1523:b0:430:a973:7e53 with SMTP id e9e14a558f8ab-430c5294ff1mr272741435ab.21.1761149053456;
        Wed, 22 Oct 2025 09:04:13 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9629c16sm5201282173.27.2025.10.22.09.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 09:04:13 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: bump cibuildwheel to 3.2.1
Date: Wed, 22 Oct 2025 11:04:06 -0500
Message-ID: <20251022160406.1810450-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Version 3.2.1 uses images CPython 3.14.0 final instead of 3.14.0-rc3.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/generate_pypi_artifacts.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index d36c606..22dad9f 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -108,7 +108,7 @@ python3 -m "${venv_module}" .venv
 venv_python="${temp_dir}/.venv/bin/python"
 
 # Install build dependencies
-${venv_python} -m pip install build==1.3.0 cibuildwheel==3.2.0
+${venv_python} -m pip install build==1.3.0 cibuildwheel==3.2.1
 
 LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
 sdist=$(find ./dist -name '*.tar.gz')
-- 
2.43.0


