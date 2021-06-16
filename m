Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C113A924C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 08:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhFPG34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 02:29:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231391AbhFPG3x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE9C5613BF;
        Wed, 16 Jun 2021 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824867;
        bh=HFXY5XjspzH1kzu2GrbFUWzI5z4ecY6jF7OZRuh585A=;
        h=From:To:Cc:Subject:Date:From;
        b=i8M85VxHQbZ50V8fMJseWf0vWBO55h7qx/5DDF1AEmTSMWhUjzMvzzmjKrtF8AKcR
         jwPUkMGj6skaSwKc3Nb/ClX/mf9rqCBl4EoOzg6hiQVc5LWnY4qtyfrSEJ7VphRRWH
         KduL0CAw/YrDU6ESOYozK0J7Mwh6gXRMtkihQq/zF3LS+B2iz9xXROxs8p6G/3birc
         rMWLHc4+eJCtsbE9xfUQ8QL3jC1cqZQSUtH6lpM1ZAmA6n8MNE4ItYkhgEns7gOcfF
         tDqXX7qE2sdpEWYSQWyUHfCyD8Rd8Zrw4MW3EN7CUxyupE2Yrivwa8Z0A4F/HN3xgi
         IJ4MvA1+etqjg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1d-004kIJ-Rv; Wed, 16 Jun 2021 08:27:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        kunit-dev@googlegroups.com, kvm@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-security-module@vger.kernel.org,
        netdev@vger.kernel.org, x86@kernel.org
Subject: [PATCH v2 00/29] docs: avoid using ReST :doc:`foo` tag
Date:   Wed, 16 Jun 2021 08:27:15 +0200
Message-Id: <cover.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

(Maintainers bcc, to avoid too many recipient troubles)

As discussed at:
	https://lore.kernel.org/linux-doc/871r9k6rmy.fsf@meer.lwn.net/

It is better to avoid using :doc:`foo` to refer to Documentation/foo.rst, as the
automarkup.py extension should handle it automatically, on most cases.

There are a couple of exceptions to this rule:

1. when :doc:  tag is used to point to a kernel-doc DOC: markup;
2. when it is used with a named tag, e. g. :doc:`some name <foo>`;

On this series:

Patch 1 manually adjust the references inside driver-api/pm/devices.rst,
as there it uses :file:`foo` to refer to some Documentation/ files;

Patch 2 converts a table at Documentation/dev-tools/kunit/api/index.rst
into a list, carefully avoiding the 

The remaining patches convert the other occurrences via a replace script.
They were manually edited, in order to honour 80-columns where possible.

This series based on docs-next branch. In order to avoid merge conflicts,
I rebased it internally against yesterday's linux-next, dropping a patch
and a hunk that would have caused conflicts there.

I'll re-send the remaining patch (plus another patch) with conflicting
changes, together with any other doc:`filename` reference that might
still be upstream by 5.14-rc1.

---

v2:
   - dropped media patches (as I merged via my own tree);
   - removed one patch that would conflict at linux-next (adm1177.rst);
   - removed one hunk fron kunit patch that would also conflict at
     linux-next.

Mauro Carvalho Chehab (29):
  docs: devices.rst: better reference documentation docs
  docs: dev-tools: kunit: don't use a table for docs name
  docs: admin-guide: pm: avoid using ReST :doc:`foo` markup
  docs: admin-guide: hw-vuln: avoid using ReST :doc:`foo` markup
  docs: admin-guide: sysctl: avoid using ReST :doc:`foo` markup
  docs: block: biodoc.rst: avoid using ReST :doc:`foo` markup
  docs: bpf: bpf_lsm.rst: avoid using ReST :doc:`foo` markup
  docs: core-api: avoid using ReST :doc:`foo` markup
  docs: dev-tools: testing-overview.rst: avoid using ReST :doc:`foo`
    markup
  docs: dev-tools: kunit: avoid using ReST :doc:`foo` markup
  docs: devicetree: bindings: submitting-patches.rst: avoid using ReST
    :doc:`foo` markup
  docs: doc-guide: avoid using ReST :doc:`foo` markup
  docs: driver-api: avoid using ReST :doc:`foo` markup
  docs: driver-api: gpio: using-gpio.rst: avoid using ReST :doc:`foo`
    markup
  docs: driver-api: surface_aggregator: avoid using ReST :doc:`foo`
    markup
  docs: driver-api: usb: avoid using ReST :doc:`foo` markup
  docs: firmware-guide: acpi: avoid using ReST :doc:`foo` markup
  docs: i2c: avoid using ReST :doc:`foo` markup
  docs: kernel-hacking: hacking.rst: avoid using ReST :doc:`foo` markup
  docs: networking: devlink: avoid using ReST :doc:`foo` markup
  docs: PCI: endpoint: pci-endpoint-cfs.rst: avoid using ReST :doc:`foo`
    markup
  docs: PCI: pci.rst: avoid using ReST :doc:`foo` markup
  docs: process: submitting-patches.rst: avoid using ReST :doc:`foo`
    markup
  docs: security: landlock.rst: avoid using ReST :doc:`foo` markup
  docs: trace: coresight: coresight.rst: avoid using ReST :doc:`foo`
    markup
  docs: trace: ftrace.rst: avoid using ReST :doc:`foo` markup
  docs: userspace-api: landlock.rst: avoid using ReST :doc:`foo` markup
  docs: virt: kvm: s390-pv-boot.rst: avoid using ReST :doc:`foo` markup
  docs: x86: avoid using ReST :doc:`foo` markup

 .../PCI/endpoint/pci-endpoint-cfs.rst         |  2 +-
 Documentation/PCI/pci.rst                     |  6 +--
 .../special-register-buffer-data-sampling.rst |  3 +-
 Documentation/admin-guide/pm/intel_idle.rst   | 16 +++++---
 Documentation/admin-guide/pm/intel_pstate.rst |  9 +++--
 Documentation/admin-guide/sysctl/abi.rst      |  2 +-
 Documentation/admin-guide/sysctl/kernel.rst   | 37 ++++++++++---------
 Documentation/block/biodoc.rst                |  2 +-
 Documentation/bpf/bpf_lsm.rst                 | 13 ++++---
 .../core-api/bus-virt-phys-mapping.rst        |  2 +-
 Documentation/core-api/dma-api.rst            |  5 ++-
 Documentation/core-api/dma-isa-lpc.rst        |  2 +-
 Documentation/core-api/index.rst              |  4 +-
 Documentation/dev-tools/kunit/api/index.rst   |  8 ++--
 Documentation/dev-tools/kunit/faq.rst         |  2 +-
 Documentation/dev-tools/kunit/index.rst       | 14 +++----
 Documentation/dev-tools/kunit/start.rst       |  4 +-
 Documentation/dev-tools/kunit/tips.rst        |  5 ++-
 Documentation/dev-tools/kunit/usage.rst       |  8 ++--
 Documentation/dev-tools/testing-overview.rst  | 16 ++++----
 .../bindings/submitting-patches.rst           | 11 +++---
 Documentation/doc-guide/contributing.rst      |  8 ++--
 Documentation/driver-api/gpio/using-gpio.rst  |  4 +-
 Documentation/driver-api/ioctl.rst            |  2 +-
 Documentation/driver-api/pm/devices.rst       |  8 ++--
 .../surface_aggregator/clients/index.rst      |  3 +-
 .../surface_aggregator/internal.rst           | 15 ++++----
 .../surface_aggregator/overview.rst           |  6 ++-
 Documentation/driver-api/usb/dma.rst          |  6 +--
 .../acpi/dsd/data-node-references.rst         |  3 +-
 .../firmware-guide/acpi/dsd/graph.rst         |  2 +-
 .../firmware-guide/acpi/enumeration.rst       |  7 ++--
 Documentation/i2c/instantiating-devices.rst   |  2 +-
 Documentation/i2c/old-module-parameters.rst   |  3 +-
 Documentation/i2c/smbus-protocol.rst          |  4 +-
 Documentation/kernel-hacking/hacking.rst      |  4 +-
 .../networking/devlink/devlink-region.rst     |  2 +-
 .../networking/devlink/devlink-trap.rst       |  4 +-
 Documentation/process/submitting-patches.rst  | 32 ++++++++--------
 Documentation/security/landlock.rst           |  3 +-
 Documentation/trace/coresight/coresight.rst   |  8 ++--
 Documentation/trace/ftrace.rst                |  2 +-
 Documentation/userspace-api/landlock.rst      | 11 +++---
 Documentation/virt/kvm/s390-pv-boot.rst       |  2 +-
 Documentation/x86/boot.rst                    |  4 +-
 Documentation/x86/mtrr.rst                    |  2 +-
 46 files changed, 171 insertions(+), 147 deletions(-)

-- 
2.31.1


