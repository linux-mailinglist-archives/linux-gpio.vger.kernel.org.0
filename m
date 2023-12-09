Return-Path: <linux-gpio+bounces-1149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DE80B5F9
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 20:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F6A280FEA
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 19:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627219BCF;
	Sat,  9 Dec 2023 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QeeSibCw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7F495
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 11:10:15 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-35da85e543eso10064335ab.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702149015; x=1702753815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqHCPc/GoRgXomfJTilskdfwF0mxrihypie/BRFV2rc=;
        b=QeeSibCwhVMeu+cIEzKVPL3dg1fvKPsXOrvZKKSmXaNBhBd6N+87ToZQOhynq5rsqK
         qMJdEYiR5KBJpxcd3LwiBBlsRCCqXxSk18fy8H5fJ6Wd8ufIpTw9IcaLwKb+vGYBaOil
         6dSCvPCMxmKUKJDPKo5JHhNzA2bUcWzsc872/flJ8CMDoE5LzMAUctCa66hCAzl56IBH
         4Fzs6H5AyWPd6vqINFY3DmTW4mny8nRUgdowX7q8NBbsX4TQtUXZHp69wH+63056UKY+
         26qNubZ97stJVlCcsVJYrNQkZjN1jpVKOFI59BIxcurmYEj+RsLlHygz9UD1YWaLPo2v
         LtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702149015; x=1702753815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqHCPc/GoRgXomfJTilskdfwF0mxrihypie/BRFV2rc=;
        b=wq9sYohJCjG6grf1d1OoyLW99nbnTfd+IVAaiGyhRqSsTXW39fSNdu3viuofSo5s98
         jjiRY+CWOkrA5mw+9ih00PxCnJDGEeRBfEOK+aw4czZIeTtSYYSrHMu9b4T8Oj6J95Uz
         I6gluyxJkIu+0cHTN1+r24nSdVF3t3dplM7xPc0mliSmzLrWAjCLJu7uoZ/tRz+/9Y5G
         Y34fxxLJ8u54NXcI12PBRWZvOduY1FSWKQJH/ePs7znDrDddcv8eewz3dG0Ij+GZBq4G
         1g/GVHlE3+rURFs/WsNn2fHwVplgRSdwMHXdLE/oahq/CLvokzkfOARUVG301JfkmP5l
         y1uQ==
X-Gm-Message-State: AOJu0YyA41vG5Eo3OIqmtXa55qiJW3HAO6deeHkqsXC6fCgUqmcx9ZmR
	IZG7AtBCt/TJIKvdfqec+/E7AoRTXDRGtk1eUskFNJFl8My1pshP
X-Google-Smtp-Source: AGHT+IGwAOyDWtDI8N5vOlCN59WS/CU7NV/I/73RAB4VVdnbSDnVQXXzDmxHX6wtJeDt9e8ihyR6yOqJxlcUaq8PrQ8=
X-Received: by 2002:a05:6e02:2145:b0:35d:47a5:ba33 with SMTP id
 d5-20020a056e02214500b0035d47a5ba33mr2261305ilv.3.1702149014812; Sat, 09 Dec
 2023 11:10:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202312091806.NgjIKxZC-lkp@intel.com>
In-Reply-To: <202312091806.NgjIKxZC-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 9 Dec 2023 20:10:03 +0100
Message-ID: <CAMRc=MdTQ1n+xJUZNrnEPn3uu9_kYatuW3EayTve9-EJ22MsTA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next] BUILD REGRESSION d22f93c6a0df15b9d1f500ab57d97ecc99b3657a
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 11:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.g=
it gpio/for-next
> branch HEAD: d22f93c6a0df15b9d1f500ab57d97ecc99b3657a  gpio: sim: impleme=
nt the dbg_show() callback
>
> Error/Warning ids grouped by kconfigs:
>
> clang_recent_errors
> `-- i386-allmodconfig
>     `-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-c=
alled
>

Is there any more information on this error? It doesn't even look like
it's related to GPIO at all.

Bart

> elapsed time: 1472m
>
> configs tested: 124
> configs skipped: 2
>
> tested configs:
> alpha                             allnoconfig   gcc
> alpha                            allyesconfig   gcc
> alpha                               defconfig   gcc
> arc                              allmodconfig   gcc
> arc                               allnoconfig   gcc
> arc                              allyesconfig   gcc
> arc                                 defconfig   gcc
> arc                   randconfig-001-20231209   gcc
> arc                   randconfig-002-20231209   gcc
> arm                               allnoconfig   gcc
> arm                                 defconfig   clang
> arm                   randconfig-001-20231209   gcc
> arm                   randconfig-002-20231209   gcc
> arm                   randconfig-003-20231209   gcc
> arm                   randconfig-004-20231209   gcc
> arm64                             allnoconfig   gcc
> arm64                               defconfig   gcc
> arm64                 randconfig-001-20231209   gcc
> arm64                 randconfig-002-20231209   gcc
> arm64                 randconfig-003-20231209   gcc
> arm64                 randconfig-004-20231209   gcc
> csky                              allnoconfig   gcc
> csky                                defconfig   gcc
> csky                  randconfig-001-20231209   gcc
> csky                  randconfig-002-20231209   gcc
> hexagon                           allnoconfig   clang
> hexagon                             defconfig   clang
> hexagon               randconfig-001-20231209   clang
> hexagon               randconfig-002-20231209   clang
> i386                             allmodconfig   clang
> i386                              allnoconfig   clang
> i386                             allyesconfig   clang
> i386         buildonly-randconfig-001-20231208   clang
> i386         buildonly-randconfig-002-20231208   clang
> i386         buildonly-randconfig-003-20231208   clang
> i386         buildonly-randconfig-004-20231208   clang
> i386         buildonly-randconfig-005-20231208   clang
> i386         buildonly-randconfig-006-20231208   clang
> i386                                defconfig   gcc
> i386                  randconfig-001-20231208   clang
> i386                  randconfig-002-20231208   clang
> i386                  randconfig-003-20231208   clang
> i386                  randconfig-004-20231208   clang
> i386                  randconfig-005-20231208   clang
> i386                  randconfig-006-20231208   clang
> i386                  randconfig-011-20231208   gcc
> i386                  randconfig-012-20231208   gcc
> i386                  randconfig-013-20231208   gcc
> i386                  randconfig-014-20231208   gcc
> i386                  randconfig-015-20231208   gcc
> i386                  randconfig-016-20231208   gcc
> loongarch                        allmodconfig   gcc
> loongarch                         allnoconfig   gcc
> loongarch                           defconfig   gcc
> loongarch             randconfig-001-20231209   gcc
> loongarch             randconfig-002-20231209   gcc
> m68k                             allmodconfig   gcc
> m68k                              allnoconfig   gcc
> m68k                             allyesconfig   gcc
> m68k                                defconfig   gcc
> microblaze                       allmodconfig   gcc
> microblaze                        allnoconfig   gcc
> microblaze                       allyesconfig   gcc
> microblaze                          defconfig   gcc
> mips                              allnoconfig   clang
> mips                             allyesconfig   gcc
> nios2                            allmodconfig   gcc
> nios2                             allnoconfig   gcc
> nios2                            allyesconfig   gcc
> nios2                               defconfig   gcc
> nios2                 randconfig-001-20231209   gcc
> nios2                 randconfig-002-20231209   gcc
> openrisc                          allnoconfig   gcc
> openrisc                         allyesconfig   gcc
> openrisc                            defconfig   gcc
> parisc                           allmodconfig   gcc
> parisc                            allnoconfig   gcc
> parisc                           allyesconfig   gcc
> parisc                              defconfig   gcc
> parisc                randconfig-001-20231209   gcc
> parisc                randconfig-002-20231209   gcc
> parisc64                            defconfig   gcc
> powerpc                          allmodconfig   clang
> powerpc                           allnoconfig   gcc
> powerpc                          allyesconfig   clang
> powerpc               randconfig-001-20231209   gcc
> powerpc               randconfig-002-20231209   gcc
> powerpc               randconfig-003-20231209   gcc
> powerpc64             randconfig-001-20231209   gcc
> powerpc64             randconfig-002-20231209   gcc
> powerpc64             randconfig-003-20231209   gcc
> riscv                            allmodconfig   gcc
> riscv                             allnoconfig   clang
> riscv                            allyesconfig   gcc
> riscv                               defconfig   gcc
> riscv                 randconfig-001-20231209   gcc
> riscv                 randconfig-002-20231209   gcc
> riscv                          rv32_defconfig   clang
> s390                             allmodconfig   gcc
> s390                              allnoconfig   gcc
> s390                             allyesconfig   gcc
> s390                                defconfig   gcc
> s390                  randconfig-001-20231209   clang
> s390                  randconfig-002-20231209   clang
> sh                               allmodconfig   gcc
> sh                                allnoconfig   gcc
> sh                               allyesconfig   gcc
> sh                                  defconfig   gcc
> sh                    randconfig-001-20231209   gcc
> sparc                            allmodconfig   gcc
> sparc64                          allmodconfig   gcc
> sparc64                          allyesconfig   gcc
> sparc64                             defconfig   gcc
> um                               allmodconfig   clang
> um                                allnoconfig   clang
> um                               allyesconfig   clang
> um                                  defconfig   gcc
> um                             i386_defconfig   gcc
> um                           x86_64_defconfig   gcc
> x86_64                            allnoconfig   gcc
> x86_64                           allyesconfig   clang
> x86_64                              defconfig   gcc
> x86_64                          rhel-8.3-rust   clang
> xtensa                            allnoconfig   gcc
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

