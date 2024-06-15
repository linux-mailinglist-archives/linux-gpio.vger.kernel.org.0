Return-Path: <linux-gpio+bounces-7464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BED909636
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 07:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFDA7283CA4
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jun 2024 05:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46BDF507;
	Sat, 15 Jun 2024 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o3c6WX7M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D0F4EE
	for <linux-gpio@vger.kernel.org>; Sat, 15 Jun 2024 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718430282; cv=none; b=G7EeaRVrw1JcW3r0PU9bcFfOcfBoE1pbZzke8EVcxhByvuXz3Qmx2sWxpCVgtly0xAoX3cXmF37IUQRgCXqDpUpaL7WfOEvEZOxl2UC/N5Z2/XUFdRvCDnAb00rwtfVUg8CgpWAFvv6mFykjNx2igZWHGvy9sKQHXmTpTn5+fbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718430282; c=relaxed/simple;
	bh=B4YR52h/NgwtkwKAaYPZWGvly5i+FzLOE166fpQTp0A=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=oFPbI2JGDY1c8fHi858/jwGJuv1LQE0QjSlskoepHRALy+O8hgHPvXvS6So9ux7pB6vKxgEi3ygTuMoTeyzPx503e7ybpMo3zJe9pLKWIeEJXjQdCJRzjHSV4RuAHGWHz8d142tOU5NAPKzewQFwCbwdUUazgZI/TdF7FyynH0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o3c6WX7M; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70599522368so2137483b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 22:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718430279; x=1719035079; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vby8yrpdFI+2mpopFDkLegmfzgPuqwhJkzA0XP/3TZg=;
        b=o3c6WX7MVX47P6/qMjSNtqUZNcXLQfj+VIUuqPdtX/G1a5Ln/QNwQ9NiW/kC/slTgJ
         nrCz/OL2LbizZAe8oMyvlico+pRiQUnWx5fsTJkAw94pAaZUttfLOzRLDH3jFSWEIsuS
         x1PB5gA0VRpdMpplNkocSI7PMRmf8XrG7JB/aYPCm1h93z4in2jT+LYR/+Hm8qthZdr4
         9F5zqKbZJrMZVv1gkqQ5FZWITy4Zy5FCcimhlfgoDTWrcW6wFITf9PEYfUrJTN5K7yW8
         mzW2K3DhaVe9m33qOMVjWGsIJeB/ZH/3EYytRktPoUuTDAx3ir/AkRtdF3HUBg5ekp38
         3QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718430279; x=1719035079;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vby8yrpdFI+2mpopFDkLegmfzgPuqwhJkzA0XP/3TZg=;
        b=DOOnftg5kLUJ5RspNndiFjP57WTNdFYZhGb6nzdMc7asCIyF4ha1bZ/K6uzQL8FFmM
         ecFzykXBjqt3e1vj55DRXW1iLzn+y5W2o4LQT+1wMcyEp5D3VzwBrWyW8LYW6jo13b6p
         dAYNpHKkx+6/XDh8meN/tupXWXLVKpn4IUtBm8sPOz+lVK6eNV2WpzMI+g/M9cDXBtMd
         PjQLJM3PxdZyHmo4b4ghyXptKYD1S1odakOxozC2ReFCFZ4wqonFsWJSOrCvGOp3zCnj
         Uixp/uI+jvMZBQZZBsY5WatoyBMSzX5PwXi/6xP6nDwOhWg/4Skuv512LnWjI/hn1ORe
         UmQw==
X-Gm-Message-State: AOJu0YxMae1oLIFdDEOVkdQnKUaag4fL9yF5gphOgDNZbg183797eDYk
	vN8qAa2Z0Gn+YluxOQ+emGs1xWjpO9CQnGyYX1zybqLiH+HJouLu1LAzuRNj6Y2xqoNdOF3Yy8z
	1
X-Google-Smtp-Source: AGHT+IF2f8D2kyX69vFSno6+Umm7wwHGR/PXXQalqlyusvly82kOZ/IVOXLN57ej1LK9hPLmoPgjWg==
X-Received: by 2002:a05:6a00:4b47:b0:704:25de:f297 with SMTP id d2e1a72fcca58-705d71d02b6mr5002181b3a.29.1718430279308;
        Fri, 14 Jun 2024 22:44:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb4157dsm4098353b3a.97.2024.06.14.22.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:44:38 -0700 (PDT)
Message-ID: <666d2a46.050a0220.cf1d.d26f@mx.google.com>
Date: Fri, 14 Jun 2024 22:44:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next baseline: 107 runs, 1 regressions (v6.6-rc1)
To: linux-gpio@vger.kernel.org, fellows@kernelci.org
From: "kernelci.org bot" <bot@kernelci.org>

linusw/for-next baseline: 107 runs, 1 regressions (v6.6-rc1)

Regressions Summary
-------------------

platform      | arch  | lab           | compiler | defconfig | regressions
--------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/for-next/kernel/v6.=
6-rc1/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   for-next
  Describe: v6.6-rc1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0bb80ecc33a8fb5a682236443c1e740d5c917d1d =



Test Regressions
---------------- =



platform      | arch  | lab           | compiler | defconfig | regressions
--------------+-------+---------------+----------+-----------+------------
r8a77960-ulcb | arm64 | lab-collabora | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/64fee612dc6a48a214286de3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//linusw/for-next/v6.6-rc1/arm64=
/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//linusw/for-next/v6.6-rc1/arm64=
/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64fee612dc6a48a214286dec
        new failure (last pass: v6.4-rc1)

    2023-09-11T10:08:04.598904  / # #

    2023-09-11T10:08:04.701027  export SHELL=3D/bin/sh

    2023-09-11T10:08:04.701461  #

    2023-09-11T10:08:04.802475  / # export SHELL=3D/bin/sh. /lava-11493746/=
environment

    2023-09-11T10:08:04.803176  =


    2023-09-11T10:08:04.904655  / # . /lava-11493746/environment/lava-11493=
746/bin/lava-test-runner /lava-11493746/1

    2023-09-11T10:08:04.905780  =


    2023-09-11T10:08:04.922887  / # /lava-11493746/bin/lava-test-runner /la=
va-11493746/1

    2023-09-11T10:08:04.971933  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-11T10:08:04.972435  + cd /lava-114937<8>[   19.194846] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11493746_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =20

